import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceninja_flutter/ui/product_reservation/product_reservation_calendar.dart';

void main() {
  test('limits calendar history to the configured number of years', () {
    final now = DateTime(2026, 9, 17);

    expect(canNavigateToPreviousReservationMonth(DateTime(2023, 10), 3, now),
        true);
    expect(canNavigateToPreviousReservationMonth(DateTime(2023, 9), 3, now),
        false);
    expect(
        canNavigateToPreviousReservationMonth(DateTime(2023, 9), 0, now), true);
  });
}
