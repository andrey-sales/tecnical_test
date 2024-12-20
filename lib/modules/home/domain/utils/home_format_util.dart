


import 'package:intl/intl.dart';

class HomeFormatUtil {


  static formatPriceDoubleToStringDollar(double value) {

    NumberFormat pattern = NumberFormat.currency(locale: 'en_US', symbol: '\$', decimalDigits: 2);

    return pattern.format(value);
  }

  static String formatReviewValueString(int value) {
    if (value >= 1e9) { return "(${(value / 1e9).toInt()}B reviews)"; }
    else if (value >= 1e6)  { return "(${(value / 1e6).toInt()}M reviews)"; }
    else if (value >= 1e3) { return "(${(value / 1e3).toInt()}K reviews)"; }
    else if(value == 1) { return "($value review)"; }
    else if (value == 0) { return "no reviews"; }
    else { return "($value reviews)" ; }
  }

}