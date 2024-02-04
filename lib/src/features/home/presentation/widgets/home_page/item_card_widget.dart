import 'package:coffee_shop_ui_challenge/src/core/common/utils/assets_names.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/constants.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/build_parent_child_text.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/icon_container.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/medium_text.dart';
import 'package:flutter/material.dart';

class ItemCardWidget extends StatelessWidget {
  final String itemName;
  final String itemType;
  final String itemPrice;
  final String itemRate;
  final String image;

  const ItemCardWidget({
    Key? key,
    required this.itemName,
    required this.itemType,
    required this.itemPrice,
    required this.itemRate,
    required this.image,
  }) : super(key: key);

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: setHeight(8),
              horizontal: setWidth(13),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
              image: DecorationImage(
                image: AssetImage('$images/$image'),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: setHeight(20),
                ),
                SizedBox(width: setWidth(5)),
                Text(
                  itemRate,
                  style: TextStyle(
                    fontSize: setFontSize(10),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: setHeight(5)),
        BuildParentChildText(
          parentText: itemName,
          childText: itemType,
          spacing: setHeight(2),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MediumText(text: "\$ $itemPrice", isBold: true),
            const IconContainer(
              iconName: plusIcon,
              iconColor: primaryColor,
            )
          ],
        ),
      ],
    );
  }
}
