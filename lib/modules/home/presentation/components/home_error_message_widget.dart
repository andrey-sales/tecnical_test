import 'package:ecommerce/modules/home/domain/tags/product_page_tags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/styles/family_style.dart';

class HomeErrorMessageWidget extends StatelessWidget {

  final String image = "assets/home/images/error.svg";
  final String title;

  const HomeErrorMessageWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).orientation == Orientation.portrait ? const EdgeInsets.only(bottom: 100): EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        spacing: 10.0,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(image,key: Key(ProductPageTAGs.homeErrorImage),width: MediaQuery.of(context).orientation == Orientation.portrait ?
          MediaQuery.of(context).size.width * 0.4: MediaQuery.of(context).size.height * 0.4 ),
          Text(title, key: Key(ProductPageTAGs.homeErrorMessage), textAlign: TextAlign.center, style: TextStyle(fontSize:

          MediaQuery.of(context).orientation == Orientation.portrait ?
          MediaQuery.of(context).size.width * 0.04 : MediaQuery.of(context).size.height * 0.04 ,fontFamily: FamilyStyle.poppins,
              fontWeight: FontWeight.w600, color: Color.fromRGBO(55, 71, 79, 0.65)))
        ],
      ),
    );
  }
}
