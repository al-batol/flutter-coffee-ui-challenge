import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  const BigText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setFontSize(double fontSize) {
      return ResponsiveLayout.getFontSize(fontSize, context);
    }

    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: setFontSize(14),
        color: const Color(0xFF2F2D2C),
      ),
    );
  }
}
