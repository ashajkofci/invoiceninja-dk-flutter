import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/ui/product_reservation/product_reservation_invoice_link.dart';
import 'package:invoiceninja_flutter/ui/product_reservation/product_reservation_localization.dart';

class ProductReservationLineStatus extends StatelessWidget {
  const ProductReservationLineStatus({
    Key? key,
    required this.item,
    required this.availability,
  }) : super(key: key);

  final InvoiceItemEntity item;
  final Future<List<dynamic>>? availability;

  @override
  Widget build(BuildContext context) {
    if (item.productKey.isEmpty || availability == null) {
      return Text('—');
    }

    return FutureBuilder<List<dynamic>>(
      future: availability,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2));
        }
        final matches = (snapshot.data ?? [])
            .where((dynamic entry) => entry['product_key'] == item.productKey);
        if (matches.isEmpty) {
          return Text('—');
        }
        final status = matches.first;
        if (status['is_stock_tracked'] != true) {
          return Text(reservationText(context, 'notTracked'),
              style: TextStyle(color: Colors.grey), maxLines: 2);
        }
        final overbooked = status['is_overbooked'] == true;
        final label = overbooked
            ? '${reservationText(context, 'overbooked')} (${status['total_quantity']}/${status['stock_quantity']})'
            : '${status['available_quantity']} ${reservationText(context, 'available')}';
        final style = TextStyle(
            color: overbooked ? Colors.red : Colors.green,
            fontWeight: FontWeight.w600);
        final reservations =
            List<Map<String, dynamic>>.from(status['reservations'] ?? []);

        if (reservations.isEmpty) {
          return Text(label, style: style, maxLines: 2);
        }

        return PopupMenuButton<Map<String, dynamic>>(
          tooltip: reservationText(context, 'reservationDetails'),
          onSelected: (reservation) => openReservationInvoice(
              context,
              StoreProvider.of<AppState>(context),
              reservation['invoice_id']?.toString()),
          itemBuilder: (context) => reservations
              .map((reservation) => PopupMenuItem(
                    value: reservation,
                    child: Text(
                        '${reservationText(context, 'invoice')} #${reservation['invoice_number']} · ${reservation['quantity']}\n${reservation['start_date']} → ${reservation['end_date']}'),
                  ))
              .toList(),
          child: Text(
            label,
            style: style.copyWith(decoration: TextDecoration.underline),
            maxLines: 2,
          ),
        );
      },
    );
  }
}
