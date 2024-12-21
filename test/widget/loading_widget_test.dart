


import 'package:ecommerce/modules/home/domain/tags/product_page_tags.dart';
import 'package:ecommerce/modules/home/presentation/components/home_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {

  testWidgets('Loading Widget test', (WidgetTester tester) async {

      String filter = "Playstation";

      final widget = MaterialApp(
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                HomeLoadingWidget(key: Key(ProductPageTAGs.homeLoading), filter: filter),
            ])));

      await tester.pumpWidget(widget);

      expect(find.byKey(Key(ProductPageTAGs.homeLoadingTitle)), findsOneWidget);
      expect(find.byKey(Key(ProductPageTAGs.homeLoading)), findsOneWidget);
      expect(find.byKey(Key(ProductPageTAGs.homeLoadingTitle)), isA<Text>());
      expect(find.text(filter), findsOneWidget);

    });
}