import 'package:ecommerce/core/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeBackButtonWidget extends StatelessWidget {
  const HomeBackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => Modular.to.pop(),
        icon: Icon(Icons.arrow_back_rounded, color: ColorStyle.black,
            size: MediaQuery.of(context).orientation == Orientation.portrait ?
            MediaQuery.of(context).size.width * 0.05 : MediaQuery.of(context).size.height * 0.04));
  }
}
