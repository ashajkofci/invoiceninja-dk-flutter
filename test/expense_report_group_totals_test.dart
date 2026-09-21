import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceninja_flutter/constants.dart';
import 'package:invoiceninja_flutter/data/models/company_model.dart';
import 'package:invoiceninja_flutter/data/models/static/currency_model.dart';
import 'package:invoiceninja_flutter/redux/reports/reports_state.dart';
import 'package:invoiceninja_flutter/ui/reports/reports_screen.dart';
import 'package:invoiceninja_flutter/ui/reports/reports_screen_vm.dart';

ReportStringValue _text(String value) => ReportStringValue(
      value: value,
      entityType: null,
      entityId: '',
    );

ReportNumberValue _amount({
  required double value,
  required String currencyId,
  required double convertedValue,
  String convertedCurrencyId = kCurrencyUSDollar,
}) =>
    ReportNumberValue(
      value: value,
      entityType: null,
      entityId: '',
      currencyId: currencyId,
      exchangeRate: null,
      convertedValue: convertedValue,
      convertedCurrencyId: convertedCurrencyId,
    );

ReportResult _report(String group, List<List<ReportElement>> data) =>
    ReportResult(
      columns: [group, 'amount'],
      allColumns: [group, 'amount'],
      defaultColumns: [group, 'amount'],
      data: data,
    );

ReportsUIState _reportState({
  required String group,
  String subgroup = kReportGroupDay,
  Map<String, String> filters = const {},
}) =>
    ReportsUIState().rebuild((b) => b
      ..report = kReportExpense
      ..group = group
      ..subgroup = subgroup
      ..filters.replace(filters));

CurrencyEntity _currency(String id, double exchangeRate) =>
    CurrencyEntity().rebuild((b) => b
      ..id = id
      ..exchangeRate = exchangeRate);

final _company = CompanyEntity();
final _reportSettings = ReportSettingsEntity();
final _currencyMap = BuiltMap<String, CurrencyEntity>({
  kCurrencyUSDollar: _currency(kCurrencyUSDollar, 1),
  '2': _currency('2', 0.5),
  '3': _currency('3', 0.25),
});

GroupTotals _totals(ReportResult report, ReportsUIState state) =>
    calculateReportTotals(
      reportResult: report,
      reportState: state,
      reportSettings: _reportSettings,
      currencyMap: _currencyMap,
      company: _company,
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('uses recorded conversions for mixed currencies grouped by month', () {
    final totals = _totals(
      _report('date', [
        [
          _text('2026-01-05'),
          _amount(value: 100, currencyId: '2', convertedValue: 90)
        ],
        [
          _text('2026-01-20'),
          _amount(value: 100, currencyId: '3', convertedValue: 120)
        ],
      ]),
      _reportState(group: 'date', subgroup: kReportGroupMonth),
    );

    expect(totals.totals!['2026-01-01']!['amount'], 210);
    expect(totals.totals!['2026-01-01']!['amount_currency_id'], 1);
  });

  test('does not convert a single-currency monthly group', () {
    final totals = _totals(
      _report('date', [
        [
          _text('2026-01-05'),
          _amount(value: 100, currencyId: '2', convertedValue: 90)
        ],
        [
          _text('2026-01-20'),
          _amount(value: 200, currencyId: '2', convertedValue: 180)
        ],
      ]),
      _reportState(group: 'date', subgroup: kReportGroupMonth),
    );

    expect(totals.totals!['2026-01-01']!['amount'], 300);
    expect(totals.totals!['2026-01-01']!['amount_currency_id'], 2);
  });

  test('uses recorded conversions for mixed currencies grouped by category',
      () {
    final totals = _totals(
      _report('category', [
        [
          _text('Travel'),
          _amount(value: 100, currencyId: '2', convertedValue: 90)
        ],
        [
          _text('Travel'),
          _amount(value: 100, currencyId: '3', convertedValue: 120)
        ],
      ]),
      _reportState(group: 'category'),
    );

    expect(totals.totals!['Travel']!['amount'], 210);
    expect(totals.totals!['Travel']!['amount_currency_id'], 1);
  });

  test('does not use recorded conversions when currency is filtered', () {
    final totals = _totals(
      _report('category', [
        [
          _text('Travel'),
          _amount(value: 100, currencyId: '2', convertedValue: 90)
        ],
        [
          _text('Travel'),
          _amount(value: 100, currencyId: '3', convertedValue: 120)
        ],
      ]),
      _reportState(
        group: 'category',
        filters: const {'currency': 'Euro'},
      ),
    );

    expect(totals.totals!['Travel']!['amount'], 600);
    expect(totals.totals!['Travel']!['amount_currency_id'], 1);
  });
}
