import 'package:flutter/material.dart';

import '../../domain/tags/product_card_tags.dart';

class HomeFavoriteButtonWidget extends StatelessWidget {

  final Function() remove;
  final Function() add;
  final bool active;

  const HomeFavoriteButtonWidget({super.key,required this.active,
    required this.remove, required this.add});

  @override
  Widget build(BuildContext context) {
    return active ?
    IconButton(onPressed: remove,
        icon: Icon(Icons.favorite,
            key: Key(ProductCardTAGs.favoriteIcon),
            size: MediaQuery.of(context).orientation == Orientation.portrait ?
            MediaQuery.of(context).size.width * 0.06 : MediaQuery.of(context).size.height * 0.05 )) :
    IconButton(onPressed: add,
        icon: Icon(Icons.favorite_border,
            key: Key(ProductCardTAGs.unfavorableIcon),
            size: MediaQuery.of(context).orientation == Orientation.portrait ?
            MediaQuery.of(context).size.width * 0.06 : MediaQuery.of(context).size.height * 0.05 ));
  }
}
