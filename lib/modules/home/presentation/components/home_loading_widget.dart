import 'package:ecommerce/core/styles/color_style.dart';
import 'package:ecommerce/core/styles/family_style.dart';
import 'package:ecommerce/modules/home/domain/tags/product_page_tags.dart';
import 'package:flutter/material.dart';

class HomeLoadingWidget extends StatelessWidget {

  final String filter;

  const HomeLoadingWidget({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10.0,
      children: [
        CircularProgressIndicator(
            key: Key(ProductPageTAGs.homeLoadingIndicator), color: ColorStyle.orange),
        Text(
            key: Key(ProductPageTAGs.homeLoadingTitle),
            "Searching ${filter.isEmpty? "Products..." : "for $filter ..."}", style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04,
            fontFamily: FamilyStyle.poppins, fontWeight: FontWeight.w600, color: Color.fromRGBO(55, 71, 79, 0.65)))
      ]
    );
  }
}
