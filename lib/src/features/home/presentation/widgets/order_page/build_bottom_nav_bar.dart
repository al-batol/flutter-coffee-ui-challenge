import 'package:coffee_shop_ui_challenge/src/core/common/utils/assets_names.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/item_chip_widget.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/svg_icon.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/cubit/order_page/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildBottomNavBar extends StatelessWidget {
  const BuildBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setWidth(double width) {
      return ResponsiveLayout.getWidth(width, context);
    }

    double setHeight(double height) {
      return ResponsiveLayout.getHeight(height, context);
    }

    double borderRadius = setWidth(24);

    return Container(
      height: setHeight(161),
      padding: EdgeInsets.all(setWidth(30)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgIcon(svgName: moneysIcon, size: setWidth(28)),
              SizedBox(width: setWidth(12)),
              Container(
                height: setHeight(28),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: const Color(0xFFF2F2F2),
                ),
                child: const Row(
                  children: [
                    CustomButton(
                      itemName: 'Cash',
                      isTextSmall: true,
                    ),
                    CustomButton(
                      itemName: '\$5.53',
                      isTransparent: true,
                      isTextSmall: true,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SvgIcon(svgName: dotsIcon, size: setWidth(28)),
            ],
          ),
          SizedBox(height: setHeight(16)),
          Expanded(
            child: BlocBuilder<OrderCubit, OrderStates>(
              builder: (context, state) {
                return Container(
                  margin: EdgeInsets.all(
                      state.shouldAnimateButton ? setWidth(4) : 0),
                  child: GestureDetector(
                    onTapUp: (_) {
                      context
                          .read<OrderCubit>()
                          .toggleAnimatedButton(state.shouldAnimateButton);
                    },
                    onTapDown: (_) {
                      context
                          .read<OrderCubit>()
                          .toggleAnimatedButton(state.shouldAnimateButton);
                    },
                    onTapCancel: () {
                      context
                          .read<OrderCubit>()
                          .toggleAnimatedButton(state.shouldAnimateButton);
                    },
                    child: CustomButton(
                      itemName: "Order",
                      fontSize: state.shouldAnimateButton ? 11 : null,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
