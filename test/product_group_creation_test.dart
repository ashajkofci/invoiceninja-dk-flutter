import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceninja_flutter/constants.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/main_app.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/redux/invoice/invoice_actions.dart';
import 'package:invoiceninja_flutter/redux/product/product_actions.dart';
import 'package:invoiceninja_flutter/redux/ui/pref_state.dart';
import 'package:invoiceninja_flutter/ui/product/edit/product_edit.dart';
import 'package:invoiceninja_flutter/ui/product/edit/product_edit_vm.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';
import 'package:redux/redux.dart';

void main() {
  testWidgets('adds an existing product while creating a group',
      (tester) async {
    final child = ProductEntity(id: 'child_hash').rebuild((b) => b
      ..productKey = 'Child product'
      ..quantity = 2);
    var appState = AppState(
      prefState: PrefState(),
      reportErrors: false,
      isWhiteLabeled: false,
    );
    final companyState = appState.userCompanyState.rebuild((b) => b
      ..userCompany.company.id = 'company_hash'
      ..productState.map[child.id] = child
      ..productState.list.add(child.id));
    appState = appState.rebuild(
      (b) => b.userCompanyStates[0] = companyState,
    );
    final editing = ValueNotifier<ProductEntity>(
      ProductEntity().rebuild((b) => b
        ..productKey = 'New group'
        ..isGroup = true),
    );

    await tester.pumpWidget(
      StoreProvider<AppState>(
        store: Store<AppState>(
          (state, action) => state,
          initialState: appState,
        ),
        child: MaterialApp(
          navigatorKey: navigatorKey,
          localizationsDelegates: const [AppLocalizationsDelegate()],
          supportedLocales: const [Locale('en')],
          home: _ProductEditHarness(
            appState: appState,
            editing: editing,
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(const ValueKey('group_product_0_')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Child product').last);
    await tester.pumpAndSettle();

    expect(editing.value.groupItems, hasLength(1));
    expect(editing.value.groupItems.single.productId, 'child_hash');
    expect(editing.value.groupItems.single.quantity, 2);
    expect(find.byKey(const ValueKey('group_product_1_')), findsOneWidget);
  });

  testWidgets('product page invoice action includes every group member',
      (tester) async {
    final group = ProductEntity(id: 'group_hash').rebuild((b) => b
      ..productKey = 'Equipment package'
      ..isGroup = true
      ..groupItems.addAll([
        _groupItem('first_hash', 'Camera', 2),
        _groupItem('second_hash', 'Tripod', 3),
      ]));
    var appState = AppState(
      prefState: PrefState(),
      reportErrors: false,
      isWhiteLabeled: false,
    );
    final companyState = appState.userCompanyState.rebuild((b) => b
      ..userCompany.isAdmin = true
      ..userCompany.company.id = 'company_hash'
      ..userCompany.company.enabledModules = kModuleInvoices
      // Reproduce the partial list-state entity which previously lost members.
      ..productState.map[group.id] = ProductEntity(id: group.id).rebuild(
        (b) => b
          ..productKey = group.productKey
          ..isGroup = true,
      )
      ..productState.list.add(group.id));
    appState = appState.rebuild(
      (b) => b.userCompanyStates[0] = companyState,
    );
    final actions = <dynamic>[];
    final store = Store<AppState>(
      (state, action) {
        actions.add(action);
        return state;
      },
      initialState: appState,
    );
    late BuildContext productPageContext;

    await tester.pumpWidget(
      StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          navigatorKey: navigatorKey,
          home: Builder(builder: (context) {
            productPageContext = context;
            return const SizedBox();
          }),
        ),
      ),
    );

    handleProductAction(
      productPageContext,
      [group],
      EntityAction.newInvoice,
    );
    await tester.pump();

    final invoice = actions.whereType<EditInvoice>().single.invoice!;
    expect(invoice.lineItems, hasLength(3));
    expect(invoice.lineItems.first.isGroup, isTrue);
    expect(
      invoice.lineItems.map((item) => item.productKey),
      ['Equipment package', 'Camera', 'Tripod'],
    );
    expect(invoice.lineItems.map((item) => item.quantity), [1, 2, 3]);
    expect(
      invoice.lineItems.map((item) => item.groupId).toSet(),
      hasLength(1),
    );
  });
}

ProductGroupItemEntity _groupItem(
  String productId,
  String productKey,
  double quantity,
) =>
    ProductGroupItemEntity((b) => b
      ..productId = productId
      ..productKey = productKey
      ..quantity = quantity
      ..notes = ''
      ..cost = 1
      ..price = 10
      ..taxCategoryId = '1'
      ..taxName1 = ''
      ..taxRate1 = 0
      ..taxName2 = ''
      ..taxRate2 = 0
      ..taxName3 = ''
      ..taxRate3 = 0
      ..customValue1 = ''
      ..customValue2 = ''
      ..customValue3 = ''
      ..customValue4 = '');

class _ProductEditHarness extends StatefulWidget {
  const _ProductEditHarness({
    required this.appState,
    required this.editing,
  });

  final AppState appState;
  final ValueNotifier<ProductEntity> editing;

  @override
  State<_ProductEditHarness> createState() => _ProductEditHarnessState();
}

class _ProductEditHarnessState extends State<_ProductEditHarness> {
  late ProductEntity product = widget.editing.value;

  @override
  Widget build(BuildContext context) {
    return ProductEdit(
      viewModel: ProductEditVM(
        state: widget.appState,
        company: widget.appState.company,
        product: product,
        origProduct: null,
        onChanged: (ProductEntity value) {
          setState(() => product = value);
          widget.editing.value = value;
        },
        onSavePressed: (_) {},
        onCancelPressed: (_) {},
        onEntityAction: (_, __) {},
        isSaving: false,
        isDirty: true,
      ),
    );
  }
}
