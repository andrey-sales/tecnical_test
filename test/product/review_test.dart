

import 'package:ecommerce/modules/home/domain/utils/home_format_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {

  group("Prices - scenery 3", () {

    test("Convert price 0", () async {

      String result = HomeFormatUtil.formatPriceDoubleToStringDollar(0);

      return expect(result, "\$0.00");
    }, timeout: Timeout(Duration(minutes: 1)));

    test("Convert price 1", () async {

      String result = HomeFormatUtil.formatPriceDoubleToStringDollar(1);

      return expect(result, "\$1.00");
    }, timeout: Timeout(Duration(minutes: 1)));

    test("Convert price 10.35", () async {

      String result = HomeFormatUtil.formatPriceDoubleToStringDollar(10.35);

      return expect(result, "\$10.35");
    }, timeout: Timeout(Duration(minutes: 1)));

    test("Convert price 14.3", () async {

      String result = HomeFormatUtil.formatPriceDoubleToStringDollar(14.3);

      return expect(result, "\$14.30");
    }, timeout: Timeout(Duration(minutes: 1)));

    test("Convert price 1000000.1", () async {

      String result = HomeFormatUtil.formatPriceDoubleToStringDollar(1000000.1);

      return expect(result, "\$1,000,000.10");
    }, timeout: Timeout(Duration(minutes: 1)));

    test("Convert price 1,040.5", () async {

      String result = HomeFormatUtil.formatPriceDoubleToStringDollar(1040.5);

      return expect(result, "\$1,040.50");
    }, timeout: Timeout(Duration(minutes: 1)));

    test("Convert price 840.5345", () async {

      String result = HomeFormatUtil.formatPriceDoubleToStringDollar(840.5345);

      return expect(result, "\$840.53");
    }, timeout: Timeout(Duration(minutes: 1)));


  });
}