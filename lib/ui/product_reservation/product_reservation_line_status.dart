import 'package:flutter/material.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
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
        return Text(
          overbooked
              ? '${reservationText(context, 'overbooked')} (${status['total_quantity']}/${status['stock_quantity']})'
              : '${status['available_quantity']} ${reservationText(context, 'available')}',
          style: TextStyle(
              color: overbooked ? Colors.red : Colors.green,
              fontWeight: FontWeight.w600),
          maxLines: 2,
        );
      },
    );
  }
}
