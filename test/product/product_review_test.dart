

import 'package:ecommerce/modules/home/domain/utils/home_format_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {

  group("Reviews  - scenery 2", ()
  {

    test("Check the convert value 0 reviews", () async {
      String result = HomeFormatUtil.formatReviewValueString(0);

      return expect(result, "no reviews");
    }, timeout: Timeout(Duration(minutes: 1)));

    test("Check the convert value 1 review", () async {
      String result = HomeFormatUtil.formatReviewValueString(1);

      return expect(result, "(1 review)");
    }, timeout: Timeout(Duration(minutes: 1)));

    test("Check the convert value 10 review", () async {
      String result = HomeFormatUtil.formatReviewValueString(10);

      return expect(result, "(10 reviews)");
    }, timeout: Timeout(Duration(minutes: 1)));

    test("Check the convert value 400 review", () async {
      String result = HomeFormatUtil.formatReviewValueString(400);

      return expect(result, "(400 reviews)");
    }, timeout: Timeout(Duration(minutes: 1)));

    test("Check the convert value 1000 review", () async {
      String result = HomeFormatUtil.formatReviewValueString(1000);

      return expect(result, "(1K reviews)");
    }, timeout: Timeout(Duration(minutes: 1)));

    test("Check the convert value 10000 review", () async {
      String result = HomeFormatUtil.formatReviewValueString(10000);

      return expect(result, "(10K reviews)");
    }, timeout: Timeout(Duration(minutes: 1)));

    test("Check the convert value 10240 review", () async {
      String result = HomeFormatUtil.formatReviewValueString(10240);

      return expect(result, "(10K reviews)");
    }, timeout: Timeout(Duration(minutes: 1)));

    test("Check the convert value 1000000 review", () async {
      String result = HomeFormatUtil.formatReviewValueString(1000000);

      return expect(result, "(1M reviews)");
    }, timeout: Timeout(Duration(minutes: 1)));

    test("Check the convert value 2000000 review", () async {
      String result = HomeFormatUtil.formatReviewValueString(2000000);

      return expect(result, "(2M reviews)");
    }, timeout: Timeout(Duration(minutes: 1)));

    test("Check the convert value 1000000000 review", () async {
      String result = HomeFormatUtil.formatReviewValueString(1000000000);

      return expect(result, "(1B reviews)");
    }, timeout: Timeout(Duration(minutes: 1)));

  });
}