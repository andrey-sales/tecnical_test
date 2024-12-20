import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/styles/color_style.dart';
import 'package:ecommerce/core/styles/family_style.dart';
import 'package:ecommerce/modules/home/domain/entities/product_entity.dart';
import 'package:ecommerce/modules/home/domain/utils/home_format_util.dart';
import 'package:ecommerce/modules/home/presentation/components/product_review_widget.dart';
import 'package:flutter/material.dart';

import '../../../domain/tags/favorite_page_tags.dart';

class FavoriteCardWidget extends StatelessWidget {

  final ProductEntity product;

  const FavoriteCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).orientation == Orientation.portrait ?
        MediaQuery.of(context).size.height * 0.2 : MediaQuery.of(context).size.height * 0.7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: CachedNetworkImage(imageUrl: product.image,key: Key(FavoritePageTAGs.image))),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                      spacing: 5.0,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                            child: Text(product.title,
                                key: Key(FavoritePageTAGs.title),
                                maxLines: 2,
                                style: TextStyle(
                                    color: ColorStyle.black,
                                    fontSize: MediaQuery.of(context).size.width * 0.04,
                                    fontFamily: FamilyStyle.poppins, fontWeight: FontWeight.w500))),

                        ProductReviewWidget(rating: product.rating),

                        Text(HomeFormatUtil.formatPriceDoubleToStringDollar(product.price),
                            key: Key(FavoritePageTAGs.price),
                            style: TextStyle(color: ColorStyle.orange,
                                fontSize: MediaQuery.of(context).size.width * 0.05,
                                fontFamily: FamilyStyle.poppins,fontWeight: FontWeight.w600))
                      ]),
                ))],
        ));
  }
}
