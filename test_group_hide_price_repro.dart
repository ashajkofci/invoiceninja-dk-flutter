import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/main_app.dart';
import 'package:invoiceninja_flutter/redux/app/app_reducer.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/redux/company/company_actions.dart';
import 'package:invoiceninja_flutter/redux/invoice/invoice_actions.dart';
import 'package:invoiceninja_flutter/ui/invoice/edit/invoice_edit_items.dart';
import 'package:invoiceninja_flutter/ui/invoice/edit/invoice_edit_items_desktop.dart';
import 'package:invoiceninja_flutter/ui/invoice/edit/invoice_edit_items_vm.dart';
import 'package:invoiceninja_flutter/ui/invoice/edit/invoice_edit_vm.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';

Future<void> _pumpInitial(WidgetTester tester, Store<AppState> store) async {
  await tester.pumpWidget(StoreProvider<AppState>(
    store: store,
    child: MaterialApp(
      navigatorKey: navigatorKey,
      localizationsDelegates: [AppLocalizationsDelegate()],
      supportedLocales: [Locale('en')],
      locale: Locale('en'),
      home: const SizedBox(),
    ),
  ));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('desktop: toggling group hide price should not throw',
      (tester) async {
    final store = Store<AppState>(
      appReducer,
      initialState: AppState(
        prefState: null,
        reportErrors: false,
        isWhiteLabeled: false,
      ),
    );

    await _pumpInitial(tester, store);

    store.dispatch(LoadCompanySuccess(UserCompanyEntity(false)
        .rebuild((b) => b.company
          ..settings.translations = MapBuilder<String?, String>({}))));

    final header = InvoiceItemEntity().rebuild((b) => b
      ..typeId = InvoiceItemEntity.TYPE_GROUP
      ..groupId = 'g1'
      ..groupTitle = 'Group'
      ..quantity = 1);

    final childA = InvoiceItemEntity().rebuild((b) => b
      ..groupId = 'g1'
      ..productKey = 'A'
      ..quantity = 2
      ..cost = 30);

    final childB = InvoiceItemEntity().rebuild((b) => b
      ..groupId = 'g1'
      ..productKey = 'B'
      ..quantity = 1
      ..cost = 30);

    final invoice = InvoiceEntity().rebuild((b) => b
      ..id = 'inv1'
      ..clientId = 'c1'
      ..lineItems.addAll([header, childA, childB]));

    store.dispatch(EditInvoice(invoice: invoice));

    await tester.pumpWidget(StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        localizationsDelegates: [AppLocalizationsDelegate()],
        supportedLocales: [Locale('en')],
        locale: Locale('en'),
        home: Builder(builder: (context) {
          final vm = InvoiceEditItemsVM.fromStore(store, false);
          final editVm = InvoiceEditVM(
            state: store.state,
            company: store.state.company,
            invoice: store.state.invoiceUIState.editing,
            invoiceItemIndex: null,
            origInvoice: null,
            isSaving: false,
          );
          return InvoiceEditItemsDesktop(
            viewModel: vm,
            entityViewModel: editVm,
            isTasks: false,
          );
        }),
      ),
    ));
    await tester.pumpAndSettle();

    // Open the popup menu of the group row and choose "Edit Group"
    await tester.tap(find.byIcon(Icons.more_vert).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Edit Group').last);
    await tester.pumpAndSettle();
    // Toggle "Hide Price" switch inside the group dialog
    final switchFinder = find.widgetWithText(SwitchListTile, 'Hide Price');
    expect(switchFinder, findsOneWidget);
    await tester.tap(switchFinder);
    await tester.pumpAndSettle();

    expect(
        store.state.invoiceUIState.editing!.lineItems[0].groupHideItemPrices,
        isTrue);
  });

  testWidgets('mobile: group dialog via editingItemIndex then hide price',
      (tester) async {
    final store = Store<AppState>(
      appReducer,
      initialState: AppState(
        prefState: null,
        reportErrors: false,
        isWhiteLabeled: false,
      ),
    );

    await _pumpInitial(tester, store);

    store.dispatch(LoadCompanySuccess(UserCompanyEntity(false)
        .rebuild((b) => b.company
          ..settings.translations = MapBuilder<String?, String>({}))));

    final header = InvoiceItemEntity().rebuild((b) => b
      ..typeId = InvoiceItemEntity.TYPE_GROUP
      ..groupId = 'g1'
      ..groupTitle = 'Group'
      ..quantity = 1);

    final childA = InvoiceItemEntity().rebuild((b) => b
      ..groupId = 'g1'
      ..productKey = 'A'
      ..quantity = 2
      ..cost = 30);

    final invoice = InvoiceEntity().rebuild((b) => b
      ..id = 'inv1'
      ..clientId = 'c1'
      ..lineItems.addAll([header, childA]));

    store.dispatch(EditInvoice(invoice: invoice));
    store.dispatch(EditInvoiceItem(0));

    await tester.pumpWidget(StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        localizationsDelegates: [AppLocalizationsDelegate()],
        supportedLocales: [Locale('en')],
        locale: Locale('en'),
        home: Builder(builder: (context) {
          final vm = InvoiceEditItemsVM.fromStore(store, false);
          final editVm = InvoiceEditVM(
            state: store.state,
            company: store.state.company,
            invoice: store.state.invoiceUIState.editing,
            invoiceItemIndex: store.state.invoiceUIState.editingItemIndex,
            origInvoice: null,
            isSaving: false,
          );
          return InvoiceEditItems(
            viewModel: vm,
            entityViewModel: editVm,
          );
        }),
      ),
    ));
    await tester.pumpAndSettle();

    // Toggle "Hide Price" switch inside the group dialog
    final switchFinder = find.widgetWithText(SwitchListTile, 'Hide Price');
expect(switchFinder, findsOneWidget);
    await tester.tap(switchFinder);
    await tester.pumpAndSettle();

    expect(
        store.state.invoiceUIState.editing!.lineItems[0].groupHideItemPrices,
        isTrue);
  });

  testWidgets('mobile: toggling group hide price should not throw',
      (tester) async {
    final store = Store<AppState>(
      appReducer,
      initialState: AppState(
        prefState: null,
        reportErrors: false,
        isWhiteLabeled: false,
      ),
    );

    await _pumpInitial(tester, store);

    store.dispatch(LoadCompanySuccess(UserCompanyEntity(false)
        .rebuild((b) => b.company
          ..settings.translations = MapBuilder<String?, String>({}))));

    final header = InvoiceItemEntity().rebuild((b) => b
      ..typeId = InvoiceItemEntity.TYPE_GROUP
      ..groupId = 'g1'
      ..groupTitle = 'Group'
      ..quantity = 1);

    final childA = InvoiceItemEntity().rebuild((b) => b
      ..groupId = 'g1'
      ..productKey = 'A'
      ..quantity = 2
      ..cost = 30);

    final invoice = InvoiceEntity().rebuild((b) => b
      ..id = 'inv1'
      ..clientId = 'c1'
      ..lineItems.addAll([header, childA]));

    store.dispatch(EditInvoice(invoice: invoice));

    await tester.pumpWidget(StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        localizationsDelegates: [AppLocalizationsDelegate()],
        supportedLocales: [Locale('en')],
        locale: Locale('en'),
        home: Builder(builder: (context) {
          final vm = InvoiceEditItemsVM.fromStore(store, false);
          final editVm = InvoiceEditVM(
            state: store.state,
            company: store.state.company,
            invoice: store.state.invoiceUIState.editing,
            invoiceItemIndex: null,
            origInvoice: null,
            isSaving: false,
          );
          return InvoiceEditItems(
            viewModel: vm,
            entityViewModel: editVm,
          );
        }),
      ),
    ));
    await tester.pumpAndSettle();

    // Tap the group tile to open the editor dialog
    await tester.tap(find.text('Group').first);
    await tester.pumpAndSettle();
    // Toggle "Hide Price" switch inside the group dialog
    final switchFinder = find.widgetWithText(SwitchListTile, 'Hide Price');
    expect(switchFinder, findsOneWidget);
    await tester.tap(switchFinder);
    await tester.pumpAndSettle();

    expect(
        store.state.invoiceUIState.editing!.lineItems[0].groupHideItemPrices,
        isTrue);
  });
}
