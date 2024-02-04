import 'package:coffee_shop_ui_challenge/src/core/common/widgets/medium_text.dart';
import 'package:flutter/material.dart';

class PriceAndTotal extends StatelessWidget {
  final String title;
  final String price;
  final bool? hasDiscount;
  final String? discount;

  const PriceAndTotal({
    Key? key,
    required this.title,
    required this.price,
    this.hasDiscount = false,
    this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MediumText(text: title),
        if (hasDiscount! && discount != null)
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                child: MediumText(text: discount!, isDiscounted: hasDiscount),
              ),
              MediumText(text: price, isBold: true),
            ],
          )
        else
          MediumText(text: price, isBold: true),
      ],
    );
  }
}
