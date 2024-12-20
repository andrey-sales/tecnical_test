import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/styles/color_style.dart';
import 'package:ecommerce/core/styles/family_style.dart';
import 'package:ecommerce/modules/home/domain/entities/product_entity.dart';
import 'package:ecommerce/modules/home/domain/mappers/router_mapper.dart';
import 'package:ecommerce/modules/home/domain/tags/product_card_tags.dart';
import 'package:ecommerce/modules/home/domain/utils/home_format_util.dart';
import 'package:ecommerce/modules/home/presentation/components/product_review_widget.dart';
import 'package:ecommerce/modules/home/presentation/stores/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_favorite_button_widget.dart';

class ProductCardWidget extends StatelessWidget {

  final HomeStore store;
  final ProductEntity product;

  const ProductCardWidget({super.key, required this.product, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => InkWell(
        onTap: () => Modular.to.pushNamed(RouterMapper.detailsIntern,arguments: [store, product]),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).orientation ==
              Orientation.portrait ? MediaQuery.of(context).size.height * 0.2 : MediaQuery.of(context).size.height * 0.7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: CachedNetworkImage(imageUrl: product.image, key: Key(ProductCardTAGs.image),
                  errorWidget: (context, value, obj) => Icon(Icons.block, color: ColorStyle.darkGray),
                  progressIndicatorBuilder: (context, value, progress) => Center(child: CircularProgressIndicator())
                  )),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      spacing: MediaQuery.of(context).orientation ==
                          Orientation.portrait ? MediaQuery.of(context).size.height * 0.005 : MediaQuery.of(context).size.width * 0.04,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(product.title,
                                key: Key(ProductCardTAGs.name),
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    color: ColorStyle.black,
                                    fontSize: MediaQuery.of(context).orientation ==
                                        Orientation.portrait ? MediaQuery.of(context).size.height * 0.018 : MediaQuery.of(context).size.width * 0.04 ,
                                    fontFamily: FamilyStyle.poppins, fontWeight: FontWeight.w500)),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ProductReviewWidget(rating: product.rating),
                                HomeFavoriteButtonWidget(
                                    key: Key(ProductCardTAGs.favoriteBT),
                                    active:store.favorites.contains(product),
                                    add: () => store.addFavorite(value: product),
                                    remove: () => store.removeFavorite(value: product))
                              ]),
                          Text(
                              key: Key(ProductCardTAGs.price),
                              HomeFormatUtil.formatPriceDoubleToStringDollar(product.price),
                              style: TextStyle(color: ColorStyle.orange,
                                  fontSize: MediaQuery.of(context).size.width * 0.05,
                                  fontFamily: FamilyStyle.poppins,fontWeight: FontWeight.w600))
                    ]),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
