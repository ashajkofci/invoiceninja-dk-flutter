import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/data/web_client.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:redux/redux.dart';

class ProductReservationCalendarScreen extends StatefulWidget {
  const ProductReservationCalendarScreen({Key? key}) : super(key: key);

  static const String route = '/reservation_calendar';

  @override
  State<ProductReservationCalendarScreen> createState() =>
      _ProductReservationCalendarScreenState();
}

class _ProductReservationCalendarScreenState
    extends State<ProductReservationCalendarScreen> {
  DateTime _month = DateTime(DateTime.now().year, DateTime.now().month);
  String _productId = '';
  late Future<_CalendarData> _data;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _data = _load();
  }

  Future<_CalendarData> _load() async {
    final state = StoreProvider.of<AppState>(context).state;
    final start = DateFormat('yyyy-MM-dd').format(_month);
    final end = DateFormat('yyyy-MM-dd')
        .format(DateTime(_month.year, _month.month + 1, 0));
    final filter = _productId.isEmpty ? '' : '&product_id=$_productId';
    final responses = await Future.wait<dynamic>([
      const WebClient().get(
        '${state.credentials.url}/product_reservations/calendar?start_date=$start&end_date=$end$filter',
        state.credentials.token,
      ),
      const WebClient().get(
        '${state.credentials.url}/product_reservations/availability?start_date=$start&end_date=$end$filter',
        state.credentials.token,
      ),
    ]);

    return _CalendarData(
      events: List<Map<String, dynamic>>.from(responses[0]['data']),
      availability: List<Map<String, dynamic>>.from(responses[1]['data']),
    );
  }

  void _changeMonth(int offset) {
    setState(() {
      _month = DateTime(_month.year, _month.month + offset);
      _data = _load();
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder: (context, Store<AppState> store) {
        final products = store.state.productState.map.values
            .where((product) => product.isDeleted != true)
            .toList()
          ..sort((a, b) => a.productKey.compareTo(b.productKey));

        return Scaffold(
          appBar: AppBar(title: Text('Reservation calendar')),
          body: FutureBuilder<_CalendarData>(
            future: _data,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              final data = snapshot.data!;
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => _changeMonth(-1),
                        icon: Icon(Icons.chevron_left),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            final now = DateTime.now();
                            _month = DateTime(now.year, now.month);
                            _data = _load();
                          });
                        },
                        child: Text('Today'),
                      ),
                      IconButton(
                        onPressed: () => _changeMonth(1),
                        icon: Icon(Icons.chevron_right),
                      ),
                      Text(
                        DateFormat('MMMM yyyy').format(_month),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        width: 280,
                        child: DropdownButtonFormField<String>(
                          initialValue: _productId,
                          decoration: InputDecoration(labelText: 'Product'),
                          items: [
                            DropdownMenuItem(
                              value: '',
                              child: Text('All products'),
                            ),
                            ...products.map(
                                (ProductEntity product) => DropdownMenuItem(
                                      value: product.id,
                                      child: Text(product.productKey),
                                    )),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _productId = value ?? '';
                              _data = _load();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  _MonthGrid(month: _month, events: data.events),
                  SizedBox(height: 24),
                  Text('Stock during this period',
                      style: Theme.of(context).textTheme.titleMedium),
                  SizedBox(height: 8),
                  ...data.availability.map((item) => Card(
                        color: item['is_overbooked'] == true
                            ? Colors.red.withValues(alpha: .12)
                            : null,
                        child: ListTile(
                          title: Text(item['product_key'].toString()),
                          subtitle: Text(
                            '${item['reserved_quantity']} reserved · ${item['stock_quantity']} in stock',
                          ),
                          trailing: Text(
                            '${item['available_quantity']} available',
                            style: TextStyle(
                              color: item['is_overbooked'] == true
                                  ? Colors.red
                                  : null,
                            ),
                          ),
                        ),
                      )),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class _MonthGrid extends StatelessWidget {
  const _MonthGrid({required this.month, required this.events});

  final DateTime month;
  final List<Map<String, dynamic>> events;

  @override
  Widget build(BuildContext context) {
    final firstWeekday = DateTime(month.year, month.month, 1).weekday % 7;
    final days = DateTime(month.year, month.month + 1, 0).day;
    final cells = firstWeekday + days;

    return LayoutBuilder(builder: (context, constraints) {
      final cellWidth = constraints.maxWidth / 7;
      return Column(
        children: [
          Row(
            children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
                .map((day) => SizedBox(
                      width: cellWidth,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(day, textAlign: TextAlign.center),
                      ),
                    ))
                .toList(),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: .9,
            ),
            itemCount: ((cells + 6) ~/ 7) * 7,
            itemBuilder: (context, index) {
              final day = index - firstWeekday + 1;
              if (day < 1 || day > days) {
                return DecoratedBox(
                    decoration: BoxDecoration(border: Border.all(width: .2)));
              }
              final date = DateTime(month.year, month.month, day);
              final dateText = DateFormat('yyyy-MM-dd').format(date);
              final dayEvents = events.where((event) =>
                  dateText.compareTo(event['start_date']) >= 0 &&
                  dateText.compareTo(event['end_date']) <= 0);

              return Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(border: Border.all(width: .2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('$day', textAlign: TextAlign.right),
                    ...dayEvents.take(3).map((event) => Container(
                          margin: const EdgeInsets.only(top: 2),
                          padding: const EdgeInsets.all(3),
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withValues(alpha: .15),
                          child: Text(
                            '#${event['invoice_number']} ${event['client_name']}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 11),
                          ),
                        )),
                  ],
                ),
              );
            },
          ),
        ],
      );
    });
  }
}

class _CalendarData {
  const _CalendarData({required this.events, required this.availability});

  final List<Map<String, dynamic>> events;
  final List<Map<String, dynamic>> availability;
}
