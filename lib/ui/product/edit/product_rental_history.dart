import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:invoiceninja_flutter/data/web_client.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/ui/product_reservation/product_reservation_invoice_link.dart';
import 'package:invoiceninja_flutter/ui/product_reservation/product_reservation_localization.dart';
import 'package:invoiceninja_flutter/utils/formatting.dart';

class ProductRentalHistory extends StatefulWidget {
  const ProductRentalHistory({
    Key? key,
    required this.state,
    required this.productId,
  }) : super(key: key);

  final AppState state;
  final String productId;

  @override
  State<ProductRentalHistory> createState() => _ProductRentalHistoryState();
}

class _ProductRentalHistoryState extends State<ProductRentalHistory> {
  late Future<Map<String, dynamic>> _history;

  @override
  void initState() {
    super.initState();
    _history = _load();
  }

  @override
  void didUpdateWidget(ProductRentalHistory oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.productId != widget.productId) {
      _history = _load();
    }
  }

  Future<Map<String, dynamic>> _load() async {
    final response = await const WebClient().get(
      '${widget.state.credentials.url}/product_reservations/history?product_id=${widget.productId}',
      widget.state.credentials.token,
    );

    return Map<String, dynamic>.from(response['data'] as Map);
  }

  Future<void> _refresh() async {
    setState(() => _history = _load());
    await _history;
  }

  String _number(BuildContext context, dynamic value) =>
      formatNumber((value as num?)?.toDouble() ?? 0, context,
          formatNumberType: FormatNumberType.double)!;

  String _money(BuildContext context, dynamic value, dynamic currencyId) =>
      formatNumber((value as num?)?.toDouble() ?? 0, context,
          currencyId: currencyId?.toString(), showCurrencyCode: true)!;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _history,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(reservationText(context, 'unableLoadHistory')),
                TextButton(
                  onPressed: () => setState(() => _history = _load()),
                  child: Text(reservationText(context, 'retry')),
                ),
              ],
            ),
          );
        }

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snapshot.data!;
        final statistics = Map<String, dynamic>.from(data['statistics'] as Map);
        final history =
            List<Map<String, dynamic>>.from(data['history'] as List);
        final years = List<Map<String, dynamic>>.from(
            statistics['by_year'] as List<dynamic>);
        final totals = List<Map<String, dynamic>>.from(
            statistics['totals_by_currency'] as List<dynamic>);
        final maxRentals = years.fold<num>(1, (max, year) {
          final rentals = year['rentals'] as num;
          return rentals > max ? rentals : max;
        });

        return RefreshIndicator(
          onRefresh: _refresh,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                reservationText(context, 'statistics'),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 24,
                runSpacing: 8,
                children: [
                  _Statistic(
                    label: reservationText(context, 'totalRentals'),
                    value: _number(context, statistics['total_rentals']),
                  ),
                  _Statistic(
                    label: reservationText(context, 'totalDays'),
                    value: _number(context, statistics['total_days']),
                  ),
                  _Statistic(
                    label: reservationText(context, 'averageDays'),
                    value: _number(context, statistics['average_days']),
                  ),
                  _Statistic(
                    label: reservationText(context, 'totalQuantity'),
                    value: _number(context, statistics['total_quantity']),
                  ),
                ],
              ),
              for (final total in totals)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Wrap(
                    spacing: 24,
                    runSpacing: 8,
                    children: [
                      _Statistic(
                        label: reservationText(context, 'totalPrice'),
                        value: _money(context, total['total_price'],
                            total['currency_id']),
                      ),
                      _Statistic(
                        label: reservationText(context, 'averagePrice'),
                        value: _money(context, total['average_price'],
                            total['currency_id']),
                      ),
                    ],
                  ),
                ),
              if (years.isNotEmpty) ...[
                const SizedBox(height: 24),
                Text(
                  reservationText(context, 'yearlyUsage'),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                for (final year in years)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 52, child: Text(year['year'].toString())),
                        Expanded(
                          child: LinearProgressIndicator(
                            value: (year['rentals'] as num) / maxRentals,
                            minHeight: 10,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '${year['rentals']} ${reservationText(context, 'rentals')}',
                        ),
                      ],
                    ),
                  ),
              ],
              const SizedBox(height: 24),
              Text(
                reservationText(context, 'history'),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              if (history.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(reservationText(context, 'noRentalHistory')),
                ),
              for (final rental in history)
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.receipt_long),
                    title: Text(
                      '${reservationText(context, 'invoice')} #${rental['invoice_number']} · ${rental['client_name']}',
                    ),
                    subtitle: Text(
                      '${rental['start_date']} → ${rental['end_date']} · ${rental['days']} ${reservationText(context, 'totalDays')}\n'
                      '${reservationText(context, 'quantity')}: ${_number(context, rental['quantity'])} · '
                      '${reservationText(context, 'unitPrice')}: ${_money(context, rental['unit_price'], rental['currency_id'])} · '
                      '${reservationText(context, 'totalPrice')}: ${_money(context, rental['total_price'], rental['currency_id'])}',
                    ),
                    isThreeLine: true,
                    onTap: () => openReservationInvoice(
                      context,
                      StoreProvider.of<AppState>(context),
                      rental['invoice_id']?.toString(),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _Statistic extends StatelessWidget {
  const _Statistic({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodySmall),
          Text(value, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
