// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_redux/flutter_redux.dart';

// Project imports:
import 'package:invoiceninja_flutter/constants.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/redux/product/product_actions.dart';
import 'package:invoiceninja_flutter/ui/app/buttons/bottom_buttons.dart';
import 'package:invoiceninja_flutter/ui/app/view_scaffold.dart';
import 'package:invoiceninja_flutter/ui/product/edit/product_rental_history.dart';
import 'package:invoiceninja_flutter/ui/product/view/product_view_documents.dart';
import 'package:invoiceninja_flutter/ui/product/view/product_view_overview.dart';
import 'package:invoiceninja_flutter/ui/product/view/product_view_vm.dart';
import 'package:invoiceninja_flutter/ui/product_reservation/product_reservation_localization.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';

class ProductView extends StatefulWidget {
  const ProductView({
    Key? key,
    required this.viewModel,
    required this.isFilter,
    required this.tabIndex,
  }) : super(key: key);

  final ProductViewVM viewModel;
  final bool isFilter;
  final int tabIndex;

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView>
    with SingleTickerProviderStateMixin {
  TabController? _controller;

  bool get _showHistory =>
      !widget.isFilter &&
      widget.viewModel.state.company.enabledModules &
              kModuleProductReservations !=
          0 &&
      (widget.viewModel.state.userCompany.canView(EntityType.invoice) ||
          widget.viewModel.state.userCompany.canEdit(EntityType.invoice));

  bool get _showDocuments =>
      widget.viewModel.state.company.isModuleEnabled(EntityType.document);

  @override
  void initState() {
    super.initState();

    final state = widget.viewModel.state;
    final tabCount = 1 + (_showHistory ? 1 : 0) + (_showDocuments ? 1 : 0);
    final savedIndex = state.productUIState.tabIndex;
    _controller = TabController(
        vsync: this,
        length: tabCount,
        initialIndex: _showHistory || widget.isFilter || !_showDocuments
            ? 0
            : savedIndex < tabCount
                ? savedIndex
                : 0);
    _controller!.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (widget.isFilter) {
      return;
    }

    final store = StoreProvider.of<AppState>(context);
    store.dispatch(UpdateProductTab(tabIndex: _controller!.index));
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.tabIndex != widget.tabIndex) {
      _controller!.index =
          widget.tabIndex < _controller!.length ? widget.tabIndex : 0;
    }
  }

  @override
  void dispose() {
    _controller!.removeListener(_onTabChanged);
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context);
    final viewModel = widget.viewModel;
    final state = viewModel.state;
    final product = viewModel.product;
    final documents = product.documents;
    final tabs = <Widget>[
      Tab(text: localization!.overview),
      if (_showDocuments)
        Tab(
          text: documents.isEmpty
              ? localization.documents
              : '${localization.documents} (${documents.length})',
        ),
      if (_showHistory) Tab(text: reservationText(context, 'history')),
    ];
    final views = <Widget>[
      RefreshIndicator(
        onRefresh: () => viewModel.onRefreshed(context),
        child: ProductOverview(
          viewModel: viewModel,
          key: ValueKey(viewModel.product.id),
        ),
      ),
      if (_showDocuments)
        RefreshIndicator(
          onRefresh: () => viewModel.onRefreshed(context),
          child: ProductViewDocuments(
            viewModel: viewModel,
            key: ValueKey(viewModel.product.id),
          ),
        ),
      if (_showHistory)
        ProductRentalHistory(state: state, productId: product.id),
    ];

    return ViewScaffold(
      isFilter: widget.isFilter,
      entity: product,
      appBarBottom: tabs.length > 1
          ? TabBar(controller: _controller, isScrollable: false, tabs: tabs)
          : null,
      body: Builder(builder: (context) {
        return Column(
          children: <Widget>[
            Expanded(
              child: views.length > 1
                  ? TabBarView(controller: _controller, children: views)
                  : views.first,
            ),
            BottomButtons(
              entity: product,
              action1: EntityAction.newInvoice,
              action2: EntityAction.clone,
            ),
          ],
        );
      }),
    );
  }
}
