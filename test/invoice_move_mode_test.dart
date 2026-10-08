import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/main_app.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/redux/ui/pref_state.dart';
import 'package:invoiceninja_flutter/ui/invoice/edit/bulk_line_items.dart';
import 'package:invoiceninja_flutter/ui/invoice/edit/invoice_edit_items_desktop.dart';
import 'package:invoiceninja_flutter/ui/invoice/edit/invoice_edit_items_vm.dart';
import 'package:invoiceninja_flutter/ui/invoice/edit/invoice_edit_vm.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';
import 'package:redux/redux.dart';
import 'invoice_group_line_item_test.dart' show item;

void main() {
  testWidgets('keeps selection in move mode and drags selected rows together',
      (tester) async {
    tester.view.physicalSize = const Size(1600, 1200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    var state = AppState(
        prefState: PrefState(), reportErrors: false, isWhiteLabeled: false);
    final companyState = state.userCompanyState.rebuild(
        (b) => b..userCompany.company.settings.translations.replace({}));
    state = state.rebuild((b) => b.userCompanyStates[0] = companyState);
    final editing = ValueNotifier(InvoiceEntity().rebuild(
        (b) => b..lineItems.addAll([item('one'), item('two'), item('three')])));
    addTearDown(editing.dispose);
    await tester.pumpWidget(StoreProvider<AppState>(
      store: Store<AppState>((state, action) => state, initialState: state),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        localizationsDelegates: const [AppLocalizationsDelegate()],
        supportedLocales: const [Locale('en')],
        home: Scaffold(
            body: ValueListenableBuilder<InvoiceEntity>(
          valueListenable: editing,
          builder: (context, invoice, _) => SingleChildScrollView(
            child: InvoiceEditItemsDesktop(
              isTasks: false,
              entityViewModel: InvoiceEditVM(
                  state: state, company: state.company, invoice: invoice),
              viewModel: InvoiceEditItemsVM(
                state: state,
                company: state.company,
                invoice: invoice,
                onChangedInvoiceItem: (_, __) {},
                onBulkLineItems: (indices, action, value, name, groupId) {
                  final items = bulkLineItems(
                      editing.value.lineItems.toList(), indices, action,
                      value: value, name: name, groupId: groupId);
                  editing.value =
                      editing.value.rebuild((b) => b..lineItems.replace(items));
                },
                onMovedInvoiceItem: (oldIndex, newIndex) {
                  editing.value =
                      editing.value.moveLineItem(oldIndex, newIndex);
                },
              ),
            ),
          ),
        )),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Checkbox), findsNWidgets(4));
    await tester.tap(find.byType(Checkbox).at(1));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.swap_vert));
    await tester.pumpAndSettle();
    expect(find.byType(ReorderableListView), findsOneWidget);
    expect(find.byType(Checkbox), findsNWidgets(4));
    expect(
        tester
            .widgetList<Checkbox>(find.byType(Checkbox))
            .where((checkbox) => checkbox.value == true),
        hasLength(1));
    await tester.tap(find.byType(Checkbox).last);
    await tester.pump();
    tester
        .widget<ReorderableListView>(find.byType(ReorderableListView))
        .onReorder(0, 3);
    await tester.pumpAndSettle();
    expect(editing.value.lineItems.map((item) => item.productKey),
        ['two', 'one', 'three']);
    expect(find.byType(Checkbox), findsNWidgets(4));
    await tester.tap(find.byType(Checkbox).first);
    await tester.pump();
    expect(
        tester
            .widgetList<Checkbox>(find.byType(Checkbox))
            .every((checkbox) => checkbox.value == true),
        isTrue);
  });
}
