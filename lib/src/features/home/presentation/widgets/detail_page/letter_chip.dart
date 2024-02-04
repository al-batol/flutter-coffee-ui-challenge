import 'package:coffee_shop_ui_challenge/src/core/common/utils/constants.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:flutter/material.dart';

class LetterChip extends StatelessWidget {
  final String letter;
  final bool isEnabled;

  const LetterChip({
    Key? key,
    required this.letter,
    required this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setWidth(double width) {
      return ResponsiveLayout.getWidth(width, context);
    }

    double setFontSize(double fontSize) {
      return ResponsiveLayout.getFontSize(fontSize, context);
    }

    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(setWidth(12)),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(setWidth(12)),
            border: Border.all(color: const Color(0xFFDEDEDE)),
          ),
          child: Text(
            letter,
            style: TextStyle(fontSize: setFontSize(12)),
          ),
        ),
        if (isEnabled)
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(setWidth(12)),
              border: Border.all(color: primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
