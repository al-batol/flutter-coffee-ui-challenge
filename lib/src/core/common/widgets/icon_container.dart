import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final String iconName;
  final Color iconColor;

  const IconContainer({
    Key? key,
    required this.iconName,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setWidth(double width) {
      return ResponsiveLayout.getWidth(width, context);
    }

    double setHeight(double height) {
      return ResponsiveLayout.getHeight(height, context);
    }

    return Padding(
      padding: EdgeInsets.all(setHeight(4)),
      child: Container(
        width: setWidth(44),
        height: setWidth(44),
        padding: EdgeInsets.all(setWidth(12)),
        decoration: BoxDecoration(
            color: iconColor,
            borderRadius: BorderRadius.circular(setWidth(12))),
        child: SvgIcon(size: setWidth(24), svgName: iconName),
      ),
    );
  }
}
