import "package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart";
import "package:flutter/material.dart";

class LargeText extends StatelessWidget {
  final String text;

  const LargeText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setFontSize(double fontSize) {
      return ResponsiveLayout.getFontSize(fontSize, context);
    }

    return Text(
      text,
      style: TextStyle(
        fontSize: setFontSize(13),
        fontWeight: FontWeight.w600,
        color: const Color(0xFF2F2D2C),
      ),
    );
  }
}
