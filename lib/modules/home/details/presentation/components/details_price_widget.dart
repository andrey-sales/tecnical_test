import 'package:ecommerce/core/styles/color_style.dart';
import 'package:ecommerce/core/styles/family_style.dart';
import 'package:ecommerce/modules/home/domain/utils/home_format_util.dart';
import 'package:flutter/material.dart';

import '../../../domain/tags/details_page_tags.dart';

class DetailsPriceWidget extends StatelessWidget {

  final double price;

  const DetailsPriceWidget({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(HomeFormatUtil.formatPriceDoubleToStringDollar(price),
        key: Key(DetailsPageTAGs.price),
        style: TextStyle(color: ColorStyle.green,
            fontSize: MediaQuery.of(context).size.width * 0.074,
            fontFamily: FamilyStyle.poppins,fontWeight: FontWeight.w600));
  }
}
