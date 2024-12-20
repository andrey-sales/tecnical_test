import 'package:ecommerce/core/styles/color_style.dart';
import 'package:ecommerce/core/styles/family_style.dart';
import 'package:ecommerce/modules/home/domain/tags/details_page_tags.dart';
import 'package:flutter/material.dart';

class HomeAppBarTitleWidget extends StatelessWidget {

  final String title;

  const HomeAppBarTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        key: Key(DetailsPageTAGs.title),
        style: TextStyle(fontFamily: FamilyStyle.poppins,
            fontWeight: FontWeight.w600,color: ColorStyle.black,
            fontSize: MediaQuery.of(context).orientation == Orientation.portrait ?
            MediaQuery.of(context).size.width * 0.05 : MediaQuery.of(context).size.height * 0.04

        ));
  }
}
