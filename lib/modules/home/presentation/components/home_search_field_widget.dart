import 'package:ecommerce/core/styles/color_style.dart';
import 'package:ecommerce/modules/home/domain/tags/product_page_tags.dart';
import 'package:flutter/material.dart';

class HomeSearchFieldWidget extends StatelessWidget {

  final String hint = "Search Anything";
  final Function(String value) onChanged;

  const HomeSearchFieldWidget({ super.key, required this.onChanged });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        key: Key(ProductPageTAGs.homeSearchTextField),
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search,color: ColorStyle.black,size: 20),
          hintText: hint,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),borderSide: BorderSide.none),
          fillColor: ColorStyle.light
        )),
    );
  }
}
