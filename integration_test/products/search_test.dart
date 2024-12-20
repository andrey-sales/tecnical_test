import 'package:ecommerce/modules/home/domain/tags/favorite_page_tags.dart';
import 'package:ecommerce/modules/home/domain/tags/product_page_tags.dart';
import 'package:ecommerce/modules/home/presentation/components/home_favorite_button_widget.dart';
import 'package:ecommerce/modules/home/presentation/components/product_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ecommerce/main.dart' as app;

void main() {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("Search Test", () {

    testWidgets("Search and update realtime the product list", (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      final field = find.byKey(Key(ProductPageTAGs.homeSearchTextField));

      const value = 'PLaySTATION';

      String currentText = '';

      for (final char in value.split('')) {
        currentText += char;
        await tester.enterText(field, currentText);
        await tester.pump();
      }

      await tester.pumpAndSettle();

      final item = find.byWidgetPredicate((widget) => widget is Text && widget.data != null && widget.data!.contains('Playstation'));

      expect(item, findsOneWidget);

      await tester.pumpAndSettle();

      await tester.enterText(field, "men");

      await tester.pumpAndSettle();

      final item2 = find.byWidgetPredicate((widget) => widget is Text && widget.data != null && widget.data!.contains('men'));

      expect(item2, findsOneWidget);

      await tester.enterText(field, "Bananas");

      await tester.pumpAndSettle();

      final item3 = find.byKey(Key(ProductPageTAGs.homeEmptyMessage));

      expect(item3, findsOneWidget);

      await tester.pumpAndSettle(Duration(seconds: 2));


    },timeout: Timeout(Duration(seconds: 30)));
  });
}