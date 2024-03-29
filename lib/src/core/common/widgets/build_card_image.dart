import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:flutter/material.dart';

class BuildCardImage extends StatelessWidget {
  final bool? isSmall;
  final String image;

  const BuildCardImage({Key? key, this.isSmall = false, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setWidth(double width) {
      return ResponsiveLayout.getWidth(width, context);
    }

    return Container(
      height: isSmall! ? setWidth(54) : setWidth(226),
      width: isSmall! ? setWidth(54) : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(setWidth(12)),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
