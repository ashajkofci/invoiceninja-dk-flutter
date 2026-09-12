import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/redux/invoice/invoice_actions.dart';
import 'package:invoiceninja_flutter/ui/product_reservation/product_reservation_localization.dart';
import 'package:redux/redux.dart';

Future<void> openReservationInvoice(
  BuildContext context,
  Store<AppState> store,
  String? invoiceId,
) async {
  if (invoiceId == null || invoiceId.isEmpty) {
    return;
  }

  try {
    if (!store.state.invoiceState.map.containsKey(invoiceId)) {
      final completer = Completer<void>();
      store.dispatch(LoadInvoice(invoiceId: invoiceId, completer: completer));
      await completer.future;
    }

    store.dispatch(ViewInvoice(invoiceId: invoiceId, force: true));
  } catch (_) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(reservationText(context, 'unableOpenInvoice'))),
      );
    }
  }
}
