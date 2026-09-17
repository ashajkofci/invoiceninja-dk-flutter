import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/main_app.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
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

    await tester.tap(find.byKey(const ValueKey('group_product_0')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Child product').last);
    await tester.pumpAndSettle();

    expect(editing.value.groupItems, hasLength(1));
    expect(editing.value.groupItems.single.productId, 'child_hash');
    expect(editing.value.groupItems.single.quantity, 2);
    expect(find.byKey(const ValueKey('group_product_1')), findsOneWidget);
  });
}

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
