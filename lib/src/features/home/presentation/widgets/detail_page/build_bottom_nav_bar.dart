import 'package:coffee_shop_ui_challenge/src/core/common/utils/constants.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/item_chip_widget.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/data/models/coffee_model.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/cubit/detail_page/detail_cubit.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildBottomNavBar extends StatelessWidget {
  final CoffeeModel coffee;

  const BuildBottomNavBar({Key? key, required this.coffee}) : super(key: key);

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

    double borderRadius = setWidth(24);

    return Container(
      height: setHeight(121),
      padding: EdgeInsets.all(setWidth(30)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: TextStyle(
                    fontSize: setFontSize(10),
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF9B9B9B),
                  ),
                ),
                SizedBox(height: setHeight(8)),
                BlocBuilder<DetailCubit, DetailStates>(
                  builder: (context, state) {
                    String coffeeSize = 'small';
                    if(state.coffeeSize == 0) {
                      coffeeSize = 'small';
                    } else if (state.coffeeSize == 1) {
                      coffeeSize = 'large';
                    } else if (state.coffeeSize == 2) {
                      coffeeSize = 'medium';
                    }
                    return Text(
                      '\$${coffee.coffeePrice[coffeeSize]}',
                      style: TextStyle(
                        fontSize: setFontSize(12),
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: BlocBuilder<DetailCubit, DetailStates>(
              builder: (context, state) {
                return GestureDetector(
                  onTapUp: (_) {
                    context
                        .read<DetailCubit>()
                        .toggleAnimatedButton(state.shouldAnimateButton);
                  },
                  onTapDown: (_) {
                    context
                        .read<DetailCubit>()
                        .toggleAnimatedButton(state.shouldAnimateButton);
                  },
                  onTapCancel: () {
                    context
                        .read<DetailCubit>()
                        .toggleAnimatedButton(state.shouldAnimateButton);
                  },
                  onTap: ( ) {
                    Navigator.pushNamed(
                      context,
                      OrderPage.routeName,
                      arguments: {
                        "coffee" : coffee,
                        "coffeeSize" : state.coffeeSize,
                      },
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(
                        state.shouldAnimateButton ? setWidth(4) : 0),
                    child: CustomButton(
                      itemName: "Buy now",
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
