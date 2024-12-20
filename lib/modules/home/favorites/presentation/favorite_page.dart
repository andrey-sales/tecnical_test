import 'package:ecommerce/core/styles/color_style.dart';
import 'package:ecommerce/core/styles/family_style.dart';
import 'package:ecommerce/modules/home/domain/entities/product_entity.dart';
import 'package:ecommerce/modules/home/domain/tags/favorite_page_tags.dart';
import 'package:ecommerce/modules/home/favorites/presentation/components/favorite_card_widget.dart';
import 'package:ecommerce/modules/home/presentation/components/home_app_bar_title_widget.dart';
import 'package:ecommerce/modules/home/presentation/components/home_back_button_widget.dart';
import 'package:flutter/material.dart';

import '../../presentation/components/home_empty_products_widget.dart';

class FavoritePage extends StatelessWidget {

  final List<ProductEntity> favorites;
  final String title = "Favorites";

  const FavoritePage({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: false,
            leading: HomeBackButtonWidget(key: Key(FavoritePageTAGs.backButton)),
            title: HomeAppBarTitleWidget(title: title, key: Key(FavoritePageTAGs.title)), forceMaterialTransparency: true),
        body: favorites.isEmpty? Column(children: [Expanded(child: Center(child: HomeEmptyProductsWidget())),]) :
        ListView.separated(
            key: Key(FavoritePageTAGs.list),
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => Divider(),
            itemCount: favorites.length,
            itemBuilder: (context, index) => FavoriteCardWidget(
                product: favorites[index], key: Key("${FavoritePageTAGs.item}_${favorites[index].id}"),))
    );
  }
}
