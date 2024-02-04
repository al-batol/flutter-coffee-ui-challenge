import 'package:coffee_shop_ui_challenge/src/core/common/utils/assets_names.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setWidth(double width) {
      return ResponsiveLayout.getWidth(width, context);
    }

    double setHeight(double height) {
      return ResponsiveLayout.getHeight(height, context);
    }

    double setFontSize(double fontSize) {
      return ResponsiveLayout.getFontSize(fontSize, context);
    }

    return Container(
      height: setHeight(150),
      width: ResponsiveLayout.screenWidth(context) - setWidth(60),
      padding: EdgeInsets.symmetric(
        horizontal: setWidth(24),
        vertical: setHeight(13),
      ),
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(setWidth(16)),
          image: const DecorationImage(
            image: AssetImage(bigCoffeeImage),
            fit: BoxFit.cover,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(setWidth(8))),
            padding: EdgeInsets.symmetric(
              vertical: setHeight(4),
              horizontal: setWidth(6),
            ),
            child: Text(
              'Promo',
              style: TextStyle(
                fontSize: setFontSize(12),
                color: Colors.white,
              ),
            ),
          ),
          Text('Buy one get',
              style: TextStyle(
                color: Colors.white,
                fontSize: setFontSize(17),
                fontWeight: FontWeight.w600,
              )),
          Text('one FREE',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: setFontSize(17),
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
