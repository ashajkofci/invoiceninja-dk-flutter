// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_redux/flutter_redux.dart';
import 'package:invoiceninja_flutter/constants.dart';

// Project imports:
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/app/app_actions.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/redux/credit/credit_actions.dart';
import 'package:invoiceninja_flutter/ui/app/app_bottom_bar.dart';
import 'package:invoiceninja_flutter/ui/app/list_filter.dart';
import 'package:invoiceninja_flutter/ui/app/list_scaffold.dart';
import 'package:invoiceninja_flutter/ui/credit/credit_list_vm.dart';
import 'package:invoiceninja_flutter/ui/credit/credit_presenter.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';
import 'credit_screen_vm.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  static const String route = '/credit';

  final CreditScreenVM viewModel;

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    final state = store.state;
    final company = state.company;
    final userCompany = state.userCompany;
    final localization = AppLocalization.of(context);

    final statuses = [
      InvoiceStatusEntity().rebuild(
        (b) => b
          ..id = kCreditStatusDraft
          ..name = localization!.draft,
      ),
      InvoiceStatusEntity().rebuild(
        (b) => b
          ..id = kCreditStatusSent
          ..name = localization!.sent,
      ),
      InvoiceStatusEntity().rebuild(
        (b) => b
          ..id = kCreditStatusViewed
          ..name = localization!.viewed,
      ),
      InvoiceStatusEntity().rebuild(
        (b) => b
          ..id = kCreditStatusApplied
          ..name = localization!.applied,
      ),
      InvoiceStatusEntity().rebuild(
        (b) => b
          ..id = kCreditStatusPartial
          ..name = localization!.partial,
      ),
      InvoiceStatusEntity().rebuild(
        (b) => b
          ..id = kCreditStatusBounced
          ..name = localization!.bounced,
      ),
    ];

    return ListScaffold(
      entityType: EntityType.credit,
      onHamburgerLongPress: () => store.dispatch(StartCreditMultiselect()),
      appBarTitle: ListFilter(
        key: ValueKey('__filter_${state.creditListState.filterClearedAt}__'),
        entityType: EntityType.credit,
        entityIds: viewModel.creditList,
        filter: state.creditListState.filter,
        onFilterChanged: (value) {
          store.dispatch(FilterCredits(value));
        },
        onSelectedState: (EntityState state, value) {
          store.dispatch(FilterCreditsByState(state));
        },
        onSelectedStatus: (EntityStatus status, value) {
          store.dispatch(FilterCreditsByStatus(status));
        },
        statuses: statuses,
      ),
      onCheckboxPressed: () {
        if (store.state.creditListState.isInMultiselect()) {
          store.dispatch(ClearCreditMultiselect());
        } else {
          store.dispatch(StartCreditMultiselect());
        }
      },
      body: CreditListBuilder(),
      bottomNavigationBar: AppBottomBar(
        entityType: EntityType.credit,
        tableColumns: CreditPresenter.getAllTableFields(userCompany),
        defaultTableColumns: CreditPresenter.getDefaultTableFields(userCompany),
        onSelectedSortField: (value) {
          store.dispatch(SortCredits(value));
        },
        sortFields: [
          CreditFields.number,
          CreditFields.amount,
          CreditFields.updatedAt,
        ],
        onSelectedState: (EntityState state, value) {
          store.dispatch(FilterCreditsByState(state));
        },
        statuses: statuses,
        onSelectedStatus: (EntityStatus status, value) {
          store.dispatch(FilterCreditsByStatus(status));
        },
        onCheckboxPressed: () {
          if (store.state.creditListState.isInMultiselect()) {
            store.dispatch(ClearCreditMultiselect());
          } else {
            store.dispatch(StartCreditMultiselect());
          }
        },
        customValues1: company.getCustomFieldValues(CustomFieldType.invoice1,
            excludeBlank: true),
        customValues2: company.getCustomFieldValues(CustomFieldType.invoice2,
            excludeBlank: true),
        customValues3: company.getCustomFieldValues(CustomFieldType.invoice3,
            excludeBlank: true),
        customValues4: company.getCustomFieldValues(CustomFieldType.invoice4,
            excludeBlank: true),
        customValues5: company.getCustomFieldValues(CustomFieldType.invoice5,
            excludeBlank: true),
        customValues6: company.getCustomFieldValues(CustomFieldType.invoice6,
            excludeBlank: true),
        customValues7: company.getCustomFieldValues(CustomFieldType.invoice7,
            excludeBlank: true),
        customValues8: company.getCustomFieldValues(CustomFieldType.invoice8,
            excludeBlank: true),
        onSelectedCustom1: (value) =>
            store.dispatch(FilterCreditsByCustom1(value)),
        onSelectedCustom2: (value) =>
            store.dispatch(FilterCreditsByCustom2(value)),
        onSelectedCustom3: (value) =>
            store.dispatch(FilterCreditsByCustom3(value)),
        onSelectedCustom4: (value) =>
            store.dispatch(FilterCreditsByCustom4(value)),
        onSelectedCustom5: (value) =>
            store.dispatch(FilterCreditsByCustom5(value)),
        onSelectedCustom6: (value) =>
            store.dispatch(FilterCreditsByCustom6(value)),
        onSelectedCustom7: (value) =>
            store.dispatch(FilterCreditsByCustom7(value)),
        onSelectedCustom8: (value) =>
            store.dispatch(FilterCreditsByCustom8(value)),
      ),
      floatingActionButton: state.prefState.isMenuFloated &&
              userCompany.canCreate(EntityType.credit)
          ? FloatingActionButton(
              heroTag: 'credit_fab',
              backgroundColor: Theme.of(context).primaryColorDark,
              onPressed: () {
                createEntityByType(
                    context: context, entityType: EntityType.credit);
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              tooltip: localization!.newCredit,
            )
          : null,
    );
  }
}
