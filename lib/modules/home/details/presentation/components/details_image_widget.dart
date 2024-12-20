import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/styles/color_style.dart';
import 'package:flutter/material.dart';

import '../../../domain/tags/details_page_tags.dart';

class DetailsImageWidget extends StatelessWidget {

  final String image;

  const DetailsImageWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).orientation == Orientation.portrait ?
        MediaQuery.of(context).size.height * 0.4: MediaQuery.of(context).size.width * 0.7,
        child: CachedNetworkImage(imageUrl: image,
            key: Key(DetailsPageTAGs.image),
            errorWidget: (context, value, obj) => Icon(Icons.block,color: ColorStyle.darkGray),
            progressIndicatorBuilder: (context, value, progress) => Center(child: CircularProgressIndicator())
    ));
  }
}
