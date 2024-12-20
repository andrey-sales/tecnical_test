

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

  group("Favorite Function", () {

    testWidgets("Favorite one Product and See on Favorite Page", (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      final item = find.byKey(Key("${ProductPageTAGs.homeItem}_1"));

      expect(item, findsOneWidget);

      final favorite = find.descendant(of: item, matching: find.byType(HomeFavoriteButtonWidget));

      HomeFavoriteButtonWidget favoriteButtonWidget = tester.firstWidget<HomeFavoriteButtonWidget>(favorite);
      ProductCardWidget productCard = tester.firstWidget<ProductCardWidget>(item);

      expect(favorite, findsOneWidget);

      if(favoriteButtonWidget.active) {
        expect(favoriteButtonWidget.active, true);

      } else {

        await tester.tap(favorite);

        favoriteButtonWidget = tester.firstWidget<HomeFavoriteButtonWidget>(favorite);

        expect(favoriteButtonWidget.active, true);
      }

      await tester.pumpAndSettle(Duration(seconds: 3));

      await tester.tap(find.byKey(Key(ProductPageTAGs.headerFavoriteBT)));

      await tester.pumpAndSettle();

      expect(find.byKey(Key(FavoritePageTAGs.backButton)), findsOneWidget);

      bool reachedEnd = false;

      final listFinder = find.byType(Scrollable);

      while (!reachedEnd) {

        try {

          final last = find.byKey(Key("${FavoritePageTAGs.item}_${productCard.product.id}"));
          await tester.ensureVisible(last);
          reachedEnd = true;

        } catch (e) {
          await tester.drag(listFinder, const Offset(0, -300));
          await tester.pump();
        }
      }

      final last = find.byKey(Key("${FavoritePageTAGs.item}_${productCard.product.id}"));

      expect(last, findsOneWidget);

      await tester.pumpAndSettle(Duration(seconds: 3));

    },timeout: Timeout(Duration(seconds: 20)));
  });
}