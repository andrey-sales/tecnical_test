import 'package:ecommerce/core/styles/color_style.dart';
import 'package:ecommerce/core/styles/family_style.dart';
import 'package:ecommerce/modules/home/domain/entities/product_entity.dart';
import 'package:ecommerce/modules/home/domain/mappers/router_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/tags/product_page_tags.dart';

class HomeHeaderWidget extends StatelessWidget {

  final String title = "Products";
  final List<ProductEntity> favorites;

  const HomeHeaderWidget({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                key: Key(ProductPageTAGs.headerTitle),
                title,style: TextStyle(fontFamily: FamilyStyle.poppins,
                fontWeight: FontWeight.w600,color: ColorStyle.black, fontSize:
                MediaQuery.of(context).orientation == Orientation.portrait ?
                MediaQuery.of(context).size.width * 0.05 : MediaQuery.of(context).size.height * 0.04)),
            InkWell(
                key: Key(ProductPageTAGs.headerFavoriteBT),
                onTap: () => Modular.to.pushNamed(RouterMapper.favoritesIntern, arguments: favorites),
                child: Icon(Icons.favorite_border,size: MediaQuery.of(context).orientation == Orientation.portrait ?
                MediaQuery.of(context).size.width * 0.06 : MediaQuery.of(context).size.height * 0.05 )),
          ]

      ),
    );
  }
}
