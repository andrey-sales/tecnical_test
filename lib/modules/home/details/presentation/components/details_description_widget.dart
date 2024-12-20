import 'package:ecommerce/core/styles/color_style.dart';
import 'package:ecommerce/core/styles/family_style.dart';
import 'package:flutter/material.dart';

import '../../../domain/tags/details_page_tags.dart';

class DetailsDescriptionWidget extends StatelessWidget {

  final String details;

  const DetailsDescriptionWidget({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.0,
        children: [
          Icon(Icons.menu_rounded,
              key: Key(DetailsPageTAGs.descriptionIcon),
              color: ColorStyle.dark, size:
          MediaQuery.of(context).orientation == Orientation.portrait ?
          MediaQuery.of(context).size.width * 0.06 :
          MediaQuery.of(context).size.width * 0.04),
          Expanded(
            child: Text(details,
                key: Key(DetailsPageTAGs.descriptionTitle),
                style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: FamilyStyle.poppins,
                fontSize: MediaQuery.of(context).orientation == Orientation.portrait ?
                MediaQuery.of(context).size.width * 0.041 : MediaQuery.of(context).size.height * 0.06,
                color: ColorStyle.dark)),
          )
        ]);
  }
}
