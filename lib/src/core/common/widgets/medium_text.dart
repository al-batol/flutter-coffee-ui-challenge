import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:flutter/material.dart';

class MediumText extends StatelessWidget {
  final String text;
  final bool? isBold;
  final bool? isDiscounted;

  const MediumText({
    Key? key,
    required this.text,
    this.isBold = false,
    this.isDiscounted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setFontSize(double fontSize) {
      return ResponsiveLayout.getFontSize(fontSize, context);
    }

    return Text(
      text,
      style: TextStyle(
        fontSize: setFontSize(11),
        fontWeight: isBold! ? FontWeight.w600 : FontWeight.w400,
        color: const Color(0xFF2F2D2C),
        decoration: isDiscounted! ? TextDecoration.lineThrough : null,
      ),
    );
  }
}
