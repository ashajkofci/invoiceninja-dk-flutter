// Flutter imports:
import 'dart:convert';

import 'package:flutter/material.dart';

// Project imports:
import 'package:invoiceninja_flutter/constants.dart';
import 'package:invoiceninja_flutter/ui/app/edit_scaffold.dart';
import 'package:invoiceninja_flutter/ui/app/form_card.dart';
import 'package:invoiceninja_flutter/ui/app/forms/app_form.dart';
import 'package:invoiceninja_flutter/ui/app/forms/bool_dropdown_button.dart';
import 'package:invoiceninja_flutter/ui/app/forms/decorated_form_field.dart';
import 'package:invoiceninja_flutter/ui/settings/product_settings_vm.dart';
import 'package:invoiceninja_flutter/ui/product_reservation/product_reservation_localization.dart';
import 'package:invoiceninja_flutter/utils/completers.dart';
import 'package:invoiceninja_flutter/utils/formatting.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';

class ProductSettings extends StatefulWidget {
  const ProductSettings({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final ProductSettingsVM viewModel;

  @override
  _ProductSettingsState createState() => _ProductSettingsState();
}

class _ProductSettingsState extends State<ProductSettings> {
  static final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: '_productSettings');
  FocusScopeNode? _focusNode;
  final _debouncer = Debouncer();
  final _stockThresholdController = TextEditingController();
  List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    _focusNode = FocusScopeNode();
  }

  @override
  void didChangeDependencies() {
    _controllers = [_stockThresholdController];

    _controllers
        .forEach((dynamic controller) => controller.removeListener(_onChanged));

    final viewModel = widget.viewModel;
    final company = viewModel.state.company;

    _stockThresholdController.text = company.stockNotificationThreshold == 0
        ? ''
        : formatNumber(
            company.stockNotificationThreshold.toDouble(),
            context,
            formatNumberType: FormatNumberType.int,
          )!;

    _controllers
        .forEach((dynamic controller) => controller.addListener(_onChanged));

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _focusNode!.dispose();
    _controllers.forEach((dynamic controller) {
      controller.removeListener(_onChanged);
      controller.dispose();
    });
    super.dispose();
  }

  void _onChanged() {
    final company = widget.viewModel.company.rebuild((b) => b
      ..stockNotificationThreshold =
          parseInt(_stockThresholdController.text.trim()));
    if (company != widget.viewModel.company) {
      _debouncer.run(() {
        widget.viewModel.onCompanyChanged(company);
      });
    }
  }

  List<Map<String, dynamic>> _timeCoefficients() {
    try {
      return (jsonDecode(widget.viewModel.company.timeCoefficientsJson) as List)
          .map((value) => Map<String, dynamic>.from(value as Map))
          .toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> _editTimeCoefficient([int? index]) async {
    final values = _timeCoefficients();
    final current = index == null ? null : values[index];
    final nameController =
        TextEditingController(text: current?['name']?.toString() ?? '');
    final valueController =
        TextEditingController(text: current?['coefficient']?.toString() ?? '1');

    final saved = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(index == null
            ? reservationText(context, 'addTimeCoefficient')
            : reservationText(context, 'editTimeCoefficient')),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration:
                  InputDecoration(labelText: reservationText(context, 'name')),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(
                  labelText: reservationText(context, 'coefficient')),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(reservationText(context, 'cancel'))),
          TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(reservationText(context, 'save'))),
        ],
      ),
    );

    if (saved == true && nameController.text.trim().isNotEmpty) {
      final value = {
        'name': nameController.text.trim(),
        'coefficient': parseDouble(valueController.text),
      };
      if (index == null) {
        values.add(value);
      } else {
        values[index] = value;
      }
      widget.viewModel.onCompanyChanged(widget.viewModel.company
          .rebuild((b) => b..timeCoefficientsJson = jsonEncode(values)));
    }

    nameController.dispose();
    valueController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context)!;
    final viewModel = widget.viewModel;
    final company = viewModel.company;

    return EditScaffold(
      title: localization.productSettings,
      onSavePressed: viewModel.onSavePressed,
      body: AppForm(
        formKey: _formKey,
        focusNode: _focusNode,
        children: <Widget>[
          FormCard(
            children: [
              SwitchListTile(
                activeThumbColor: Theme.of(context).colorScheme.secondary,
                title: Text(localization.trackInventory),
                value: company.trackInventory,
                subtitle: Text(localization.trackInventoryHelp),
                onChanged: (value) => viewModel.onCompanyChanged(
                    company.rebuild((b) => b
                      ..trackInventory = value
                      ..enabledModules = value
                          ? company.enabledModules & ~kModuleProductReservations
                          : company.enabledModules)),
              ),
              SwitchListTile(
                activeThumbColor: Theme.of(context).colorScheme.secondary,
                title: Text(reservationText(context, 'reservationTracking')),
                value: !company.trackInventory &&
                    company.enabledModules & kModuleProductReservations != 0,
                subtitle:
                    Text(reservationText(context, 'reservationTrackingHelp')),
                onChanged: (value) => viewModel.onCompanyChanged(
                    company.rebuild((b) => b
                      ..trackInventory = value ? false : company.trackInventory
                      ..enabledModules = value
                          ? company.enabledModules | kModuleProductReservations
                          : company.enabledModules &
                              ~kModuleProductReservations)),
              ),
              if (company.trackInventory) ...[
                SwitchListTile(
                  activeThumbColor: Theme.of(context).colorScheme.secondary,
                  title: Text(localization.stockNotifications),
                  value: company.stockNotification,
                  subtitle: Text(localization.stockNotificationsHelp),
                  onChanged: (value) => viewModel.onCompanyChanged(
                      company.rebuild((b) => b..stockNotification = value)),
                ),
                if (company.stockNotification)
                  DecoratedFormField(
                    keyboardType: TextInputType.number,
                    controller: _stockThresholdController,
                    label: localization.notificationThreshold,
                  ),
              ],
            ],
          ),
          FormCard(
            children: <Widget>[
              SwitchListTile(
                activeThumbColor: Theme.of(context).colorScheme.secondary,
                title: Text(localization.showProductDiscount),
                value: company.enableProductDiscount,
                subtitle: Text(localization.showProductDiscountHelp),
                onChanged: (value) => viewModel.onCompanyChanged(
                    company.rebuild((b) => b..enableProductDiscount = value)),
              ),
              SwitchListTile(
                activeThumbColor: Theme.of(context).colorScheme.secondary,
                title: Text(localization.showProductCost),
                value: company.enableProductCost,
                subtitle: Text(localization.showCostHelp),
                onChanged: (value) => viewModel.onCompanyChanged(
                    company.rebuild((b) => b..enableProductCost = value)),
              ),
              SwitchListTile(
                activeThumbColor: Theme.of(context).colorScheme.secondary,
                title: Text(localization.showProductQuantity),
                value: company.enableProductQuantity,
                subtitle: Text(localization.showProductQuantityHelp),
                onChanged: (value) => viewModel.onCompanyChanged(
                    company.rebuild((b) => b..enableProductQuantity = value)),
              ),
              SwitchListTile(
                activeThumbColor: Theme.of(context).colorScheme.secondary,
                title: Text(localization.defaultQuantity),
                value: company.defaultQuantity,
                subtitle: Text(localization.defaultQuantityHelp),
                onChanged: (value) => viewModel.onCompanyChanged(
                    company.rebuild((b) => b..defaultQuantity = value)),
              ),
              SwitchListTile(
                activeThumbColor: Theme.of(context).colorScheme.secondary,
                title: Text(reservationText(context, 'rentalTimeCoefficients')),
                subtitle: Text(reservationText(context, 'timeCoefficientHelp')),
                value: company.enableTimeCoefficient,
                onChanged: (value) => viewModel.onCompanyChanged(
                    company.rebuild((b) => b..enableTimeCoefficient = value)),
              ),
              if (company.enableTimeCoefficient) ...[
                ..._timeCoefficients().asMap().entries.map((entry) => ListTile(
                      title: Text(entry.value['name']?.toString() ?? ''),
                      subtitle:
                          Text(entry.value['coefficient']?.toString() ?? '1'),
                      onTap: () => _editTimeCoefficient(entry.key),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () {
                          final values = _timeCoefficients()
                            ..removeAt(entry.key);
                          viewModel.onCompanyChanged(company.rebuild((b) =>
                              b..timeCoefficientsJson = jsonEncode(values)));
                        },
                      ),
                    )),
                ListTile(
                  leading: const Icon(Icons.add),
                  title: Text(reservationText(context, 'addTimeCoefficient')),
                  onTap: _editTimeCoefficient,
                ),
              ],
            ],
          ),
          FormCard(
            isLast: true,
            children: <Widget>[
              SwitchListTile(
                activeThumbColor: Theme.of(context).colorScheme.secondary,
                title: Text(localization.showProductDescription),
                value: company.showProductDetails,
                subtitle: Text(localization.showProductDescriptionHelp),
                onChanged: (value) => viewModel.onCompanyChanged(
                    company.rebuild((b) => b..showProductDetails = value)),
              ),
              SwitchListTile(
                activeThumbColor: Theme.of(context).colorScheme.secondary,
                title: Text(localization.fillProducts),
                value: company.fillProducts,
                subtitle: Text(localization.fillProductsHelp),
                onChanged: (value) => viewModel.onCompanyChanged(
                    company.rebuild((b) => b..fillProducts = value)),
              ),
              SwitchListTile(
                activeThumbColor: Theme.of(context).colorScheme.secondary,
                title: Text(localization.updateProducts),
                value: company.updateProducts,
                subtitle: Text(localization.updateProductsHelp),
                onChanged: (value) => viewModel.onCompanyChanged(
                    company.rebuild((b) => b..updateProducts = value)),
              ),
              SwitchListTile(
                activeThumbColor: Theme.of(context).colorScheme.secondary,
                title: Text(localization.convertProducts),
                value: company.convertProductExchangeRate,
                subtitle: Text(localization.convertProductsHelp),
                onChanged: (value) => viewModel.onCompanyChanged(company
                    .rebuild((b) => b..convertProductExchangeRate = value)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BoolDropdownButton(
                  label: localization.convertTo,
                  value: company.convertRateToClient,
                  onChanged: (value) => viewModel.onCompanyChanged(
                    company.rebuild((b) => b..convertRateToClient = value),
                  ),
                  enabledLabel: localization.clientCurrency,
                  disabledLabel: localization.companyCurrency,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
