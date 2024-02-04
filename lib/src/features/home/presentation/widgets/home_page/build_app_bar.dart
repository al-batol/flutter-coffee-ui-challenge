import 'package:coffee_shop_ui_challenge/src/core/common/utils/assets_names.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/svg_icon.dart';
import 'package:flutter/material.dart';


class BuildAppBar extends StatelessWidget {
  const BuildAppBar({Key? key}) : super(key: key);

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

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: setHeight(3)),
            Text(
              "Location",
              style: TextStyle(
                fontSize: setFontSize(12),
                fontWeight: FontWeight.w400,
                color: const Color(0xFFB7B7B7),
                letterSpacing: setFontSize(0.12),
              ),
            ),
            SizedBox(height: setHeight(4)),
            Row(
              children: [
                Text(
                  "Bilzen, Tanjungbalai",
                  style: TextStyle(
                    fontSize: setFontSize(14),
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFDDDDDD),
                    letterSpacing: setFontSize(0.12),
                  ),
                ),
                SizedBox(width: setWidth(4)),
                SvgIcon(size: setWidth(24), svgName: arrowDownIcon),
              ],
            ),
          ],
        ),
        const Image(image: AssetImage(girlImage)),
      ],
    );
  }
}
