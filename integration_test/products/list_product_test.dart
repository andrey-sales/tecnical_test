

import 'package:ecommerce/modules/home/domain/tags/favorite_page_tags.dart';
import 'package:ecommerce/modules/home/domain/tags/product_page_tags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ecommerce/main.dart' as app;

void main() {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("Product and Navigation", () {

    testWidgets("Find List and Products and Navigation between Favorites and Home", (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      expect(find.byKey(Key(ProductPageTAGs.homeList)), findsOneWidget);
      expect(find.byKey(Key("${ProductPageTAGs.homeItem}_0")), findsOneWidget);
      expect(find.byKey(Key("${ProductPageTAGs.homeItem}_1")), findsOneWidget);

      await tester.tap(find.byKey(Key(ProductPageTAGs.headerFavoriteBT)));

      await tester.pumpAndSettle();

      expect(find.text('Favorites'), findsOneWidget);

      await Future.delayed(Duration(seconds: 1));

      await tester.tap(find.byKey(Key(FavoritePageTAGs.backButton)));

      await tester.pumpAndSettle();

      expect(find.text('Products'), findsOneWidget);

      await Future.delayed(Duration(seconds: 1));

    });
  });
}