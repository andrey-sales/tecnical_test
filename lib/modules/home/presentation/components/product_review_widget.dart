import 'package:ecommerce/core/styles/color_style.dart';
import 'package:ecommerce/core/styles/family_style.dart';
import 'package:ecommerce/modules/home/domain/entities/rating_entity.dart';
import 'package:flutter/material.dart';

import '../../domain/tags/product_card_tags.dart';
import '../../domain/utils/home_format_util.dart';

class ProductReviewWidget extends StatelessWidget {

  final RatingEntity rating;

  const ProductReviewWidget({ super.key, required this.rating });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 5.0,
      children: [
        Icon(Icons.star, key: Key(ProductCardTAGs.ratingIcon),color: Colors.yellow,size: MediaQuery.of(context).size.width * 0.06),
        Text("${rating.rate.toStringAsFixed(1)} ${HomeFormatUtil.formatReviewValueString(rating.count)}",
            key: Key(ProductCardTAGs.ratingTitle),
            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035,color: ColorStyle.darkGray,
                fontFamily: FamilyStyle.poppins, fontWeight: FontWeight.w600))
      ],
    );
  }
}
