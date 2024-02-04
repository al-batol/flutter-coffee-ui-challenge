import 'package:coffee_shop_ui_challenge/src/core/common/utils/assets_names.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:flutter/material.dart';

class BuildRowStar extends StatelessWidget {
  final String rate;

  const BuildRowStar({Key? key, required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setWidth(double width) {
      return ResponsiveLayout.getWidth(width, context);
    }

    double setFontSize(double fontSize) {
      return ResponsiveLayout.getFontSize(fontSize, context);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        SizedBox(width: setWidth(4)),
        RichText(
          text: TextSpan(
              text: rate,
              style: TextStyle(
                fontSize: setFontSize(12),
                fontWeight: FontWeight.w600,
                color: Color(0xFF2F2D2C),
              ),
              children: [
                WidgetSpan(
                  child: SizedBox(width: setWidth(5)),
                ),
                TextSpan(
                  text: '(230)',
                  style: TextStyle(
                    fontSize: setFontSize(10),
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF9B9B9B),
                  ),
                )
              ]),
        ),
        Spacer(),
        Container(
          height: setWidth(60),
          width: setWidth(60),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(setWidth(20)),
            image:
                DecorationImage(image: AssetImage(beanIcon), fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: setWidth(4)),
        Container(
          height: setWidth(60),
          width: setWidth(60),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(setWidth(20)),
            image: DecorationImage(
                image: AssetImage(packagingIcon), fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }
}
