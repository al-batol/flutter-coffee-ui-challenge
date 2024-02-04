import 'package:coffee_shop_ui_challenge/src/core/common/utils/constants.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/medium_text.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final String text;
  final String iconName;

  const IconTextWidget({
    Key? key,
    required this.text,
    required this.iconName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setWidth(double width) {
      return ResponsiveLayout.getWidth(width, context);
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: setWidth(12),
        vertical: setWidth(6),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: lightGreyColor),
      ),
      child: Row(
        children: [
          SvgIcon(svgName: iconName, size: setWidth(24)),
          SizedBox(
            width: setWidth(4),
          ),
          MediumText(text: text),
        ],
      ),
    );
  }
}
