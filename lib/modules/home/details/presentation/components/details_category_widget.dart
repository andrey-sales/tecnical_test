import 'package:ecommerce/core/styles/color_style.dart';
import 'package:ecommerce/core/styles/family_style.dart';
import 'package:flutter/material.dart';

import '../../../domain/tags/details_page_tags.dart';

class DetailsCategoryWidget extends StatelessWidget {


  final String category;

  const DetailsCategoryWidget({ super.key, required this.category });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.0,
      children: [
        Icon(Icons.sort_rounded,color: ColorStyle.dark,
            key: Key(DetailsPageTAGs.categoryIcon),
            size: MediaQuery.of(context).orientation == Orientation.portrait ?
            MediaQuery.of(context).size.width * 0.06 : MediaQuery.of(context).size.width * 0.04),
        Text(category,
            key: Key(DetailsPageTAGs.categoryTitle),
            style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: FamilyStyle.poppins,
            fontSize: MediaQuery.of(context).orientation == Orientation.portrait ?
            MediaQuery.of(context).size.width * 0.041 : MediaQuery.of(context).size.height * 0.06,
            color: ColorStyle.dark))
      ]);
  }
}
