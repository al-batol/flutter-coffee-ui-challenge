import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:flutter/material.dart';

class BuildParentChildText extends StatelessWidget {
  final String parentText;
  final String childText;
  final double spacing;

  const BuildParentChildText({
    Key? key,
    required this.parentText,
    required this.childText,
    required this.spacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setFontSize(double fontSize) {
      return ResponsiveLayout.getFontSize(fontSize, context);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          parentText,
          style: TextStyle(
            fontSize: setFontSize(12),
            fontWeight: FontWeight.w600,
            color: Color(0xFF2F2D2C),
          ),
        ),
        SizedBox(height: spacing),
        Text(
          childText,
          style: TextStyle(
            fontSize: setFontSize(10),
            fontWeight: FontWeight.w400,
            color: Color(0xFF9B9B9B),
          ),
        ),
      ],
    );
  }
}
