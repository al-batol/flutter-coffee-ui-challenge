import 'package:coffee_shop_ui_challenge/src/core/common/utils/assets_names.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

class BuildDiscountWidget extends StatelessWidget {
  const BuildDiscountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setWidth(double width) {
      return ResponsiveLayout.getWidth(width, context);
    }

    double setFontSize(double fontSize) {
      return ResponsiveLayout.getFontSize(fontSize, context);
    }

    return Container(
      padding: EdgeInsets.all(setWidth(16)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(setWidth(14)),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgIcon(svgName: discountIcon, size: setWidth(25)),
              SizedBox(width: setWidth(12)),
              Text(
                '1 Discount is applied',
                style: TextStyle(
                  fontSize: setFontSize(12),
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SvgIcon(svgName: arrowRightIcon, size: setWidth(25)),
        ],
      ),
    );
  }
}
