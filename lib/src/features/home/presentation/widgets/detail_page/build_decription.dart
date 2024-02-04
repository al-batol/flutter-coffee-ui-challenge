import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/big_text.dart';
import 'package:flutter/material.dart';

class BuildDescription extends StatelessWidget {
  final String description;

  const BuildDescription({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setHeight(BuildContext context, double height) {
      return ResponsiveLayout.getHeight(height, context);
    }

    double setFontSize(BuildContext context, double fontSize) {
      return ResponsiveLayout.getFontSize(fontSize, context);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BigText(text: 'Description'),
        SizedBox(height: setHeight(context, 12)),
        Text(
          description,
          style: TextStyle(
            fontSize: setFontSize(context, 11.5),
            height: setFontSize(context, 1),
            fontWeight: FontWeight.w400,
            color: Color(0xFF9B9B9B),
          ),
        ),
      ],
    );
  }
}
