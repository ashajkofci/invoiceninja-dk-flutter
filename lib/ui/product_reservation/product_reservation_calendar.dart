import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/data/web_client.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/ui/product_reservation/product_reservation_invoice_link.dart';
import 'package:invoiceninja_flutter/ui/product_reservation/product_reservation_localization.dart';
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

  void _changeMonth(int offset) => setState(() {
        _month = DateTime(_month.year, _month.month + offset);
        _data = _load();
      });

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(builder: (context, Store<AppState> store) {
      final products = store.state.productState.map.values
          .where((product) => product.isDeleted != true)
          .toList()
        ..sort((a, b) => a.notes.compareTo(b.notes));

      return Scaffold(
        appBar: AppBar(title: Text(reservationText(context, 'calendar'))),
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
            final visibleAvailability = data.availability
                .where((item) =>
                    item['is_stock_tracked'] == true &&
                    (item['reserved_quantity'] as num? ?? 0) > 0)
                .toList();
            return ListView(padding: const EdgeInsets.all(16), children: [
              Wrap(
                spacing: 12,
                runSpacing: 12,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  IconButton(
                      onPressed: () => _changeMonth(-1),
                      icon: Icon(Icons.chevron_left)),
                  OutlinedButton(
                    onPressed: () => setState(() {
                      final now = DateTime.now();
                      _month = DateTime(now.year, now.month);
                      _data = _load();
                    }),
                    child: Text(reservationText(context, 'today')),
                  ),
                  IconButton(
                      onPressed: () => _changeMonth(1),
                      icon: Icon(Icons.chevron_right)),
                  Text(
                      DateFormat('MMMM yyyy',
                              Localizations.localeOf(context).toString())
                          .format(_month),
                      style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(
                    width: 280,
                    child: DropdownButtonFormField<String>(
                      initialValue: _productId,
                      decoration: InputDecoration(
                          labelText: reservationText(context, 'product')),
                      items: [
                        DropdownMenuItem(
                            value: '',
                            child:
                                Text(reservationText(context, 'allProducts'))),
                        ...products
                            .map((ProductEntity product) => DropdownMenuItem(
                                  value: product.id,
                                  child: Text(
                                      product.notes.isEmpty
                                          ? reservationText(context, 'product')
                                          : product.notes,
                                      overflow: TextOverflow.ellipsis),
                                )),
                      ],
                      onChanged: (value) => setState(() {
                        _productId = value ?? '';
                        _data = _load();
                      }),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              _MonthGrid(month: _month, events: data.events, store: store),
              SizedBox(height: 24),
              Text(reservationText(context, 'stockPeriod'),
                  style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 8),
              if (visibleAvailability.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(reservationText(
                      context, 'noCurrentOrFutureReservations')),
                )
              else
                ...visibleAvailability
                    .map((item) => _AvailabilityCard(item: item)),
            ]);
          },
        ),
      );
    });
  }
}

class _MonthGrid extends StatelessWidget {
  const _MonthGrid(
      {required this.month, required this.events, required this.store});
  final DateTime month;
  final List<Map<String, dynamic>> events;
  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    final firstWeekday = DateTime(month.year, month.month, 1).weekday % 7;
    final days = DateTime(month.year, month.month + 1, 0).day;
    final cells = firstWeekday + days;
    final locale = Localizations.localeOf(context).toString();

    return LayoutBuilder(builder: (context, constraints) {
      final cellWidth = constraints.maxWidth / 7;
      return Column(children: [
        Row(
            children: List.generate(7, (index) {
          final day = DateTime(2023, 1, 1 + index);
          return SizedBox(
            width: cellWidth,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(DateFormat.E(locale).format(day),
                  textAlign: TextAlign.center),
            ),
          );
        })),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7, childAspectRatio: .9),
          itemCount: ((cells + 6) ~/ 7) * 7,
          itemBuilder: (context, index) {
            final day = index - firstWeekday + 1;
            if (day < 1 || day > days) {
              return DecoratedBox(
                  decoration: BoxDecoration(border: Border.all(width: .2)));
            }
            final date = DateTime(month.year, month.month, day);
            final dateText = DateFormat('yyyy-MM-dd').format(date);
            final now = DateTime.now();
            final isToday = date.year == now.year &&
                date.month == now.month &&
                date.day == now.day;
            final dayEvents = events.where((event) =>
                dateText.compareTo(event['start_date']) >= 0 &&
                dateText.compareTo(event['end_date']) <= 0);

            return Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isToday ? Colors.amber.withValues(alpha: .12) : null,
                border: Border.all(
                    color: isToday ? Colors.amber : Colors.grey,
                    width: isToday ? 2 : .2),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('$day',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontWeight: isToday ? FontWeight.bold : null)),
                    ...dayEvents.take(3).map((event) => InkWell(
                          onTap: () => openReservationInvoice(
                              context, store, event['invoice_id']?.toString()),
                          child: Container(
                            margin: const EdgeInsets.only(top: 2),
                            padding: const EdgeInsets.all(3),
                            color: _hexColor(
                                event['color']?.toString() ?? '#2563eb'),
                            child: Text(
                              '#${event['invoice_number']} ${event['client_name']}\n${event['status'] ?? ''}',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontSize: 11, color: Colors.white),
                            ),
                          ),
                        )),
                  ]),
            );
          },
        ),
      ]);
    });
  }
}

class _AvailabilityCard extends StatelessWidget {
  const _AvailabilityCard({required this.item});
  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    final tracked = item['is_stock_tracked'] == true;
    final reservations =
        List<Map<String, dynamic>>.from(item['reservations'] ?? []);
    return Card(
      color: item['is_overbooked'] == true
          ? Colors.red.withValues(alpha: .12)
          : null,
      child: ExpansionTile(
        title: Text(item['product_description']?.toString() ??
            reservationText(context, 'product')),
        subtitle: Text(tracked
            ? '${item['reserved_quantity']} ${reservationText(context, 'reserved')} · ${item['stock_quantity']} ${reservationText(context, 'stock')} · ${item['available_quantity']} ${reservationText(context, 'available')}'
            : reservationText(context, 'notTracked')),
        children: reservations.isEmpty
            ? [
                ListTile(
                    title: Text(reservationText(context, 'noReservations')))
              ]
            : reservations
                .map((reservation) => ListTile(
                      leading: Container(
                          width: 6,
                          color: _hexColor(
                              reservation['color']?.toString() ?? '#2563eb')),
                      title: Text(
                          '${reservationText(context, 'invoice')} #${reservation['invoice_number']} · ${reservation['client_name']}'),
                      subtitle: Text(
                          '${reservation['start_date']} → ${reservation['end_date']} · ${reservation['quantity']} · ${reservation['status'] ?? ''}'),
                      onTap: () => openReservationInvoice(
                          context,
                          StoreProvider.of<AppState>(context),
                          reservation['invoice_id']?.toString()),
                    ))
                .toList(),
      ),
    );
  }
}

Color _hexColor(String value) {
  final safe = RegExp(r'^#[0-9a-fA-F]{6}$').hasMatch(value) ? value : '#2563eb';
  return Color(int.parse('FF${safe.substring(1)}', radix: 16));
}

class _CalendarData {
  const _CalendarData({required this.events, required this.availability});
  final List<Map<String, dynamic>> events;
  final List<Map<String, dynamic>> availability;
}
