import 'package:coffee_shop_ui_challenge/src/core/common/utils/constants.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/large_text.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/cubit/order_page/order_cubit.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/widgets/order_page/price_and_total.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildPaymentSummary extends StatelessWidget {
  final double itemPrice;

  const BuildPaymentSummary({Key? key, required this.itemPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setHeight(double height) {
      return ResponsiveLayout.getHeight(height, context);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LargeText(text: 'Payment Summary'),
        SizedBox(height: setHeight(16)),
        PriceAndTotal(title: "Price", price: "\$${itemPrice.toString()}"),
        const PriceAndTotal(
          title: "Delivery Fee",
          hasDiscount: true,
          discount: '\$2.0',
          price: "\$4.53",
        ),
        const Divider(color: lightGreyColor),
        BlocBuilder<OrderCubit, OrderStates>(
          builder: (context, state) {
            final String finalPrice =
                (state.counter * itemPrice).toStringAsFixed(2);
            return PriceAndTotal(
              title: "Total Payment",
              price: "\$$finalPrice",
            );
          },
        ),
      ],
    );
  }
}
