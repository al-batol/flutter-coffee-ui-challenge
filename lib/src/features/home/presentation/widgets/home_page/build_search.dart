import 'package:coffee_shop_ui_challenge/src/core/common/utils/assets_names.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/constants.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/icon_container.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

class BuildSearch extends StatelessWidget {
  const BuildSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setWidth(BuildContext context, double width) {
      return ResponsiveLayout.getWidth(width, context);
    }

    double setHeight(BuildContext context, double height) {
      return ResponsiveLayout.getHeight(height, context);
    }

    double setFontSize(BuildContext context, double fontSize) {
      return ResponsiveLayout.getFontSize(fontSize, context);
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(setWidth(context, 16)),
        color: Color(0xFF313131),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(setWidth(context, 16)),
            child: Row(
              children: [
                SvgIcon(size:  setWidth(context, 24), svgName: searchIcon),
                SizedBox(width: setWidth(context, 12)),
                Text(
                  "Search coffee",
                  style: TextStyle(
                    fontSize: setFontSize(context, 12),
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF989898),
                    letterSpacing: setFontSize(context, 0.12),
                  ),
                ),
              ],
            ),
          ),
          const IconContainer(
            iconName: settingIcon,
            iconColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
