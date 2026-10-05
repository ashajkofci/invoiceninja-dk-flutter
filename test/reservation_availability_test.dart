import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceninja_flutter/constants.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/ui/product_reservation/reservation_availability.dart';
import 'invoice_group_line_item_test.dart' show item;

final company = CompanyEntity().rebuild((b) => b
  ..id = 'company-a'
  ..enabledModules = kModuleProductReservations
  ..reservationStartCustomField = 1
  ..reservationEndCustomField = 2);
const credentials =
    Credentials(url: 'https://example.com/api/v1', token: 'test');
InvoiceEntity invoice() => InvoiceEntity().rebuild((b) => b
  ..id = 'invoice-a'
  ..customValue1 = '2026-10-05'
  ..customValue2 = '2026-10-06'
  ..lineItems.add(item('camera')));

void main() {
  testWidgets(
      'retains the future for pricing, descriptions, grouping and row order',
      (tester) async {
    var requests = 0;
    final availability = ReservationAvailability(load: (_, invoice) async {
      requests++;
      return <dynamic>[];
    });
    addTearDown(availability.dispose);
    final original = invoice();
    availability.update(credentials, company, original);
    final future = availability.future;
    await tester.pump();
    final changed = original.rebuild((b) => b
      ..lineItems[0] = original.lineItems[0].rebuild((b) => b
        ..notes = 'Typing'
        ..cost = 99
        ..discount = 10
        ..timeCoefficient = 3
        ..groupId = 'a')
      ..lineItems.add(item('header', typeId: InvoiceItemEntity.TYPE_GROUP)));
    availability.update(
        Credentials(url: credentials.url, token: credentials.token),
        company,
        changed);
    await tester.pump(const Duration(seconds: 1));
    expect(requests, 1);
    expect(availability.future, same(future));
  });

  testWidgets(
      'debounces relevant edits and uses the latest product and quantity',
      (tester) async {
    final requests = <InvoiceEntity>[];
    final availability = ReservationAvailability(load: (_, invoice) async {
      requests.add(invoice);
      return <dynamic>[];
    });
    addTearDown(availability.dispose);
    final original = invoice();
    availability.update(credentials, company, original);
    final firstFuture = availability.future;
    final changed = original.rebuild((b) => b
      ..lineItems[0] = original.lineItems[0].rebuild((b) => b..quantity = 2));
    availability.update(credentials, company, changed);
    expect(availability.future, isNot(same(firstFuture)));
    await tester.pump(const Duration(milliseconds: 150));
    final finalInvoice = changed.rebuild((b) => b
      ..lineItems[0] = changed.lineItems[0].rebuild((b) => b
        ..productKey = 'lens'
        ..quantity = 4));
    availability.update(credentials, company, finalInvoice);
    await tester.pump(const Duration(milliseconds: 150));
    availability.update(
        credentials,
        company,
        finalInvoice.rebuild((b) => b
          ..lineItems[0] =
              finalInvoice.lineItems[0].rebuild((b) => b..notes = 'Typing')));
    await tester.pump(const Duration(milliseconds: 149));
    expect(requests, hasLength(1));
    await tester.pump(const Duration(milliseconds: 1));
    expect(requests, hasLength(2));
    expect(requests.last.lineItems.first.productKey, 'lens');
    expect(requests.last.lineItems.first.quantity, 4);
  });

  testWidgets(
      'refreshes dates and scope but cancels disabled and disposed checks',
      (tester) async {
    var requests = 0;
    final availability = ReservationAvailability(load: (_, invoice) async {
      requests++;
      return <dynamic>[];
    });
    final original = invoice();
    availability.update(credentials, company, original);
    final changed = original.rebuild((b) => b..customValue2 = '2026-10-10');
    availability.update(credentials, company, changed);
    await tester.pump(const Duration(milliseconds: 300));
    expect(requests, 2);
    availability.update(
        credentials, company.rebuild((b) => b..id = 'company-b'), changed);
    await tester.pump(const Duration(milliseconds: 300));
    expect(requests, 3);
    availability.update(Credentials(url: credentials.url, token: 'other'),
        company, changed);
    expect(requests, 4);
    availability.update(credentials, company, original);
    expect(requests, 5);
    availability.update(credentials, company, changed);
    availability.update(
        credentials, company.rebuild((b) => b..enabledModules = 0), changed);
    expect(availability.future, isNull);
    await tester.pump(const Duration(milliseconds: 500));
    expect(requests, 5);
    availability.update(
        credentials, company, original.rebuild((b) => b..customValue1 = ''));
    expect(availability.future, isNull);
    availability.update(credentials, company, original);
    expect(requests, 6);
    availability.update(credentials, company, changed);
    availability.dispose();
    await tester.pump(const Duration(milliseconds: 500));
    expect(requests, 6);
  });

  test('aggregates only physical products and ignores row order', () {
    final original = invoice();
    final items = [
      item(' camera ').rebuild((b) => b..quantity = 2),
      item('camera').rebuild((b) => b..quantity = 3),
      item('camera', typeId: InvoiceItemEntity.TYPE_TASK),
      item('camera', typeId: InvoiceItemEntity.TYPE_GROUP),
      item(''),
      item('lens').rebuild((b) => b..quantity = -1),
    ];
    final withItems = original.rebuild((b) => b..lineItems.replace(items));
    final equivalent = original.rebuild((b) => b
      ..lineItems.replace([
        item('lens').rebuild((b) => b..quantity = 0),
        item('camera').rebuild((b) => b..quantity = 5),
      ]));
    expect(reservationAvailabilityKey(company, withItems, false),
        reservationAvailabilityKey(company, equivalent, false));
    expect(reservationAvailabilityKey(company, withItems, true), isNull);
    expect(
        reservationAvailabilityKey(
            company,
            original.rebuild((b) => b..entityType = EntityType.purchaseOrder),
            false),
        isNull);
  });
}
