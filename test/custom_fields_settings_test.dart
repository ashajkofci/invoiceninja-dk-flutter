import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceninja_flutter/data/models/company_model.dart';
import 'package:invoiceninja_flutter/data/models/entities.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/redux/ui/pref_state.dart';
import 'package:invoiceninja_flutter/ui/settings/custom_fields.dart';
import 'package:invoiceninja_flutter/ui/settings/custom_fields_vm.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';
import 'package:redux/redux.dart';

void main() {
  testWidgets('shows eight product and invoice custom field settings',
      (tester) async {
    final viewModel = CustomFieldsVM(
      state: AppState(
        prefState: PrefState(),
        reportErrors: false,
        isWhiteLabeled: false,
      ),
      onSavePressed: (_) {},
      company: CompanyEntity(),
      onCompanyChanged: (_) {},
    );

    Future<void> pumpFields(String fieldType) => tester.pumpWidget(
          StoreProvider<AppState>(
            store: Store<AppState>(
              (state, action) => state,
              initialState: viewModel.state,
            ),
            child: MaterialApp(
              localizationsDelegates: const [AppLocalizationsDelegate()],
              supportedLocales: const [Locale('en')],
              home: Scaffold(
                body: SingleChildScrollView(
                  child: CustomFieldsSettings(
                    fieldType: fieldType,
                    viewModel: viewModel,
                  ),
                ),
              ),
            ),
          ),
        );

    await pumpFields(CustomFieldType.product);
    expect(find.byType(CustomFormField), findsNWidgets(8));

    await pumpFields(CustomFieldType.invoice);
    expect(find.byType(CustomFormField), findsNWidgets(8));

    await pumpFields(CustomFieldType.client);
    expect(find.byType(CustomFormField), findsNWidgets(4));
  });
}
