import 'package:ecommerce/modules/home/domain/tags/details_page_tags.dart';
import 'package:ecommerce/modules/home/domain/tags/product_page_tags.dart';
import 'package:ecommerce/modules/home/presentation/components/home_favorite_button_widget.dart';
import 'package:ecommerce/modules/home/presentation/components/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ecommerce/main.dart' as app;

void main() {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("Details Favorite Test", () {

    testWidgets("Click on Favorite Details and Back and Compare the status", (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      final item = find.byKey(Key("${ProductPageTAGs.homeItem}_0"));

      expect(item, findsOneWidget);

      await tester.tap(item);

      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key(DetailsPageTAGs.favoriteBT)));

      await tester.pumpAndSettle();

      HomeFavoriteButtonWidget detailsFavoriteButtonWidget = tester.firstWidget<HomeFavoriteButtonWidget>(find.byKey(Key(DetailsPageTAGs.favoriteBT)));

      await tester.tap(find.byKey(Key(DetailsPageTAGs.backButton)));

      await tester.pumpAndSettle();

      final favorite = find.descendant(of: item, matching: find.byType(HomeFavoriteButtonWidget));

      HomeFavoriteButtonWidget favoriteHomeButtonWidget = tester.firstWidget<HomeFavoriteButtonWidget>(favorite);

      expect(favoriteHomeButtonWidget.active, detailsFavoriteButtonWidget.active);

      await tester.pumpAndSettle(Duration(seconds: 2));

    },timeout: Timeout(Duration(seconds: 20)));
  });
}