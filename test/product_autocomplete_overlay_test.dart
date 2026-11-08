import 'dart:ui' show PointerDeviceKind;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceninja_flutter/data/models/product_model.dart';
import 'package:invoiceninja_flutter/ui/app/autocomplete_options_overlay.dart';
import 'package:invoiceninja_flutter/ui/app/entity_dropdown.dart';

void main() {
  final products = [
    ProductEntity().rebuild((b) => b
      ..id = 'first'
      ..productKey = 'ARTICLE-1'
      ..notes = 'Article name and description'
      ..price = 12.5),
    ProductEntity().rebuild((b) => b
      ..id = 'second'
      ..productKey = 'ARTICLE-2'
      ..notes = 'Another article'
      ..price = 25),
  ];

  Future<void> openSearch(
      WidgetTester tester, ValueChanged<ProductEntity> onSelected) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 60),
              child: SizedBox(
                width: 140,
                child: RawAutocomplete<ProductEntity>(
                  displayStringForOption: (product) => product.productKey,
                  optionsBuilder: (_) => products,
                  onSelected: onSelected,
                  fieldViewBuilder:
                      (context, controller, focusNode, onSubmit) => TextField(
                    controller: controller,
                    focusNode: focusNode,
                    onSubmitted: (_) => onSubmit(),
                  ),
                  optionsViewBuilder: (context, select, options) =>
                      AutocompleteOptionsOverlay(
                    child: Material(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (final product in options)
                            EntityAutocompleteListTile(
                              entity: product,
                              subtitle: product.notes,
                              overrideSuggestedAmount: (_) =>
                                  '${product.price}',
                              onTap: (entity) =>
                                  select(entity as ProductEntity),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 250),
            Builder(
              builder: (context) => TextButton(
                onPressed: () => FocusScope.of(context).unfocus(),
                child: const Text('Outside the search'),
              ),
            ),
          ],
        ),
      ),
    ));
    await tester.tap(find.byType(TextField));
    await tester.enterText(find.byType(TextField), 'ARTICLE');
    await tester.pumpAndSettle();
    expect(find.byType(EntityAutocompleteListTile), findsNWidgets(2));
  }

  for (final kind in [PointerDeviceKind.mouse, PointerDeviceKind.touch]) {
    for (final area in ['number', 'description', 'price', 'padding']) {
      testWidgets('selects an article at its $area with ${kind.name}',
          (tester) async {
        ProductEntity? selected;
        await openSearch(tester, (product) => selected = product);
        final row =
            tester.getRect(find.byType(EntityAutocompleteListTile).first);
        final point = switch (area) {
          'number' => row.topLeft + const Offset(25, 20),
          'description' => tester.getCenter(find.text(products.first.notes)),
          'price' => tester.getCenter(find.text('12.5')),
          _ => Offset(row.right - 4, row.center.dy),
        };
        if (area != 'number') {
          expect(point.dx,
              greaterThan(tester.getRect(find.byType(TextField)).right));
        }
        await tester.tapAt(point, kind: kind);
        await tester.pumpAndSettle();
        expect(selected, same(products.first));
        expect(find.byType(EntityAutocompleteListTile), findsNothing);
      });
    }
  }

  testWidgets('preserves keyboard selection', (tester) async {
    ProductEntity? selected;
    await openSearch(tester, (product) => selected = product);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(selected, same(products[1]));
    expect(find.byType(EntityAutocompleteListTile), findsNothing);
  });

  testWidgets('dismisses the whole overlay when focus leaves the field',
      (tester) async {
    ProductEntity? selected;
    await openSearch(tester, (product) => selected = product);
    await tester.tap(find.text('Outside the search'));
    await tester.pumpAndSettle();
    expect(selected, isNull);
    expect(find.byType(EntityAutocompleteListTile), findsNothing);
  });
}
