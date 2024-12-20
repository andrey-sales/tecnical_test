

import 'package:ecommerce/modules/home/domain/tags/details_page_tags.dart';
import 'package:ecommerce/modules/home/domain/tags/product_page_tags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ecommerce/main.dart' as app;

void main() {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("Details Test", () {

    testWidgets("Verify Elements on Details Page", (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      final item = find.byKey(Key("${ProductPageTAGs.homeItem}_0"));

      expect(item, findsOneWidget);

      await tester.tap(item);

      await tester.pumpAndSettle();

      expect(find.byKey(Key(DetailsPageTAGs.title)), findsOneWidget);
      expect(find.byKey(Key(DetailsPageTAGs.image)), findsOneWidget);
      expect(find.byKey(Key(DetailsPageTAGs.name)), findsOneWidget);
      expect(find.byKey(Key(DetailsPageTAGs.favoriteBT)), findsOneWidget);

      bool reachedEnd = false;

      await tester.pumpAndSettle(Duration(seconds: 3));

      final listFinder = find.byType(Scrollable);

      while (!reachedEnd) {

        try {

          final last = find.byKey(Key(DetailsPageTAGs.descriptionTitle));
          await tester.ensureVisible(last);
          reachedEnd = true;

        } catch (e) {
          await tester.drag(listFinder, const Offset(0, -300));
          await tester.pump();
        }
      }

      await tester.pumpAndSettle(Duration(seconds: 1));


      expect(find.byKey(Key(DetailsPageTAGs.categoryIcon)), findsOneWidget);
      expect(find.byKey(Key(DetailsPageTAGs.categoryTitle)), findsOneWidget);
      expect(find.byKey(Key(DetailsPageTAGs.descriptionIcon)), findsOneWidget);
      expect(find.byKey(Key(DetailsPageTAGs.descriptionTitle)), findsOneWidget);

      await tester.drag(listFinder, const Offset(0, 600));




    },timeout: Timeout(Duration(seconds: 20)));
  });
}