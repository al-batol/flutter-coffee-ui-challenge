import 'package:coffee_shop_ui_challenge/src/core/common/utils/constants.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String itemName;
  final bool? isSelected;
  final bool? isTransparent;
  final bool? isTextSmall;
  final double? fontSize;

  const CustomButton({
    Key? key,
    required this.itemName,
    this.isSelected = true,
    this.isTransparent = false,
    this.isTextSmall = false,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setWidth(double width) {
      return ResponsiveLayout.getWidth(width, context);
    }

    double setFontSize(double fontSize) {
      return ResponsiveLayout.getFontSize(fontSize, context);
    }

    return Container(
      decoration: BoxDecoration(
          color: isTransparent!
              ? Colors.transparent
              : isSelected!
                  ? primaryColor
                  : Colors.white,
          borderRadius: BorderRadius.circular(setWidth(12))),
      padding: EdgeInsets.symmetric(
        horizontal: setWidth(16),
      ),
      alignment: Alignment.center,
      child: Text(
        itemName,
        style: TextStyle(
          color: isSelected! && !isTransparent! ? Colors.white : Colors.black,
          fontSize: isTextSmall! ? setFontSize(10.5) : setFontSize(fontSize ?? 12),
        ),
      ),
    );
  }
}
