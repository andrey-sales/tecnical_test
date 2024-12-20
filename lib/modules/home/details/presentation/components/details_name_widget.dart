import 'package:ecommerce/core/styles/color_style.dart';
import 'package:ecommerce/core/styles/family_style.dart';
import 'package:flutter/material.dart';

import '../../../domain/tags/details_page_tags.dart';

class DetailsNameWidget extends StatelessWidget {

  final String name;

  const DetailsNameWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(name,
        key: Key(DetailsPageTAGs.name),
        textAlign: TextAlign.left, style: TextStyle(
        color: ColorStyle.black,fontFamily: FamilyStyle.poppins,
        fontSize: MediaQuery.of(context).orientation == Orientation.portrait ?
        MediaQuery.of(context).size.width * 0.048 : MediaQuery.of(context).size.height * 0.06));
  }
}
