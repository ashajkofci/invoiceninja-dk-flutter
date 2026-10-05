import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:invoiceninja_flutter/constants.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/data/repositories/invoice_repository.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';

// Keep this in step with ProductReservationService::quantitiesByProductKey.
// Prices, descriptions, grouping and row order do not affect availability.
String? reservationAvailabilityKey(
    CompanyEntity company, InvoiceEntity invoice, bool isTasks) {
  if (isTasks ||
      !(invoice.isInvoice || invoice.isQuote) ||
      company.enabledModules & kModuleProductReservations == 0) {
    return null;
  }
  final customValues = [
    invoice.customValue1,
    invoice.customValue2,
    invoice.customValue3,
    invoice.customValue4,
    invoice.customValue5,
    invoice.customValue6,
    invoice.customValue7,
    invoice.customValue8,
  ];
  String date(int field) =>
      field >= 1 && field <= 8 ? customValues[field - 1] : '';
  final start = date(company.reservationStartCustomField);
  final end = date(company.reservationEndCustomField);
  if (start.isEmpty || end.isEmpty) return null;

  final quantities = <String, double>{};
  for (final item in invoice.lineItems) {
    final key = item.productKey.trim();
    if (item.typeId != InvoiceItemEntity.TYPE_STANDARD || key.isEmpty) continue;
    quantities[key] = (quantities[key] ?? 0) + math.max(0, item.quantity);
  }
  final keys = quantities.keys.toList()..sort();
  return jsonEncode([
    company.id,
    invoice.entityType.toString(),
    invoice.id,
    company.reservationStartCustomField,
    company.reservationEndCustomField,
    start,
    end,
    for (final key in keys) [key, quantities[key]],
  ]);
}

class ReservationAvailability {
  ReservationAvailability({
    Future<List<dynamic>> Function(Credentials, InvoiceEntity)? load,
    this.debounce = const Duration(milliseconds: 300),
  }) : _load = load ?? const InvoiceRepository().getProductAvailability;

  final Future<List<dynamic>> Function(Credentials, InvoiceEntity) _load;
  final Duration debounce;
  String? _key;
  Credentials? _credentials;
  Timer? _timer;
  Completer<List<dynamic>>? _pending;
  Future<List<dynamic>>? future;

  void update(
      Credentials credentials, CompanyEntity company, InvoiceEntity invoice,
      {bool isTasks = false}) {
    final key = reservationAvailabilityKey(company, invoice, isTasks);
    final sameCredentials = _credentials?.url == credentials.url &&
        _credentials?.token == credentials.token;
    if (key == _key && sameCredentials) return;
    final immediate = _key == null || !sameCredentials;
    _cancelPending();
    _key = key;
    _credentials = credentials;
    if (key == null) {
      future = null;
      return;
    }

    final pending = Completer<List<dynamic>>();
    _pending = pending;
    // A new future prevents old stock results from displaying for changed input.
    future = pending.future;
    void check() {
      _timer = null;
      _pending = null;
      pending.complete(Future.sync(() => _load(credentials, invoice)));
    }

    if (immediate) {
      check();
    } else {
      _timer = Timer(debounce, check);
    }
  }

  void _cancelPending() {
    _timer?.cancel();
    _timer = null;
    _pending?.complete(<dynamic>[]);
    _pending = null;
  }

  void dispose() => _cancelPending();
}
