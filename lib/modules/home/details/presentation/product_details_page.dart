import 'package:ecommerce/core/styles/color_style.dart';
import 'package:ecommerce/modules/home/details/presentation/components/details_category_widget.dart';
import 'package:ecommerce/modules/home/details/presentation/components/details_description_widget.dart';
import 'package:ecommerce/modules/home/details/presentation/components/details_image_widget.dart';
import 'package:ecommerce/modules/home/details/presentation/components/details_name_widget.dart';
import 'package:ecommerce/modules/home/domain/entities/product_entity.dart';
import 'package:ecommerce/modules/home/presentation/components/home_app_bar_title_widget.dart';
import 'package:ecommerce/modules/home/presentation/components/home_back_button_widget.dart';
import 'package:ecommerce/modules/home/presentation/components/product_review_widget.dart';
import 'package:ecommerce/modules/home/presentation/stores/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../domain/tags/details_page_tags.dart';
import '../../presentation/components/home_favorite_button_widget.dart';
import 'components/details_price_widget.dart';

class ProductDetailsPage extends StatelessWidget {

  final HomeStore store;
  final ProductEntity product;

  final String title = "Product Details";

  const ProductDetailsPage({ super.key, required this.store, required this.product });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: HomeAppBarTitleWidget(title: title),
            centerTitle: false,
            forceMaterialTransparency: true,
            actions: [
              HomeFavoriteButtonWidget(
                  key: Key(DetailsPageTAGs.favoriteBT),
                  active:store.favorites.contains(product),
                  add: () => store.addFavorite(value: product),
                  remove: () => store.removeFavorite(value: product))],
            leading: HomeBackButtonWidget(key: Key(DetailsPageTAGs.backButton))),
        body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20.0,
                  children: [
                    DetailsImageWidget(image: product.image),
                    DetailsNameWidget(name: product.title),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ProductReviewWidget(rating: product.rating),
                          DetailsPriceWidget(price: product.price)
                        ]),
                    DetailsCategoryWidget(category: product.category),
                    DetailsDescriptionWidget(details: product.description)

                  ]),
            )),
      ));
  }
}
