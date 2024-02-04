import 'package:coffee_shop_ui_challenge/src/core/common/utils/assets_names.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/constants.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/build_parent_child_text.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/large_text.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/data/models/coffee_model.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/cubit/order_page/order_cubit.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/widgets/order_page/build_app_bar.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/widgets/order_page/build_bottom_nav_bar.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/widgets/order_page/build_deliver_pick_up.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/widgets/order_page/build_discount_widget.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/widgets/order_page/build_increase_decrease_item.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/widgets/order_page/build_payment_summary.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/widgets/order_page/icon_text_wiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderPage extends StatelessWidget {
  static const String routeName = '/order_page';
  final CoffeeModel coffee;
  final int coffeeSize;

  const OrderPage({Key? key, required this.coffee, required this.coffeeSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setWidth(double width) {
      return ResponsiveLayout.getWidth(width, context);
    }

    double setHeight(double height) {
      return ResponsiveLayout.getHeight(height, context);
    }

    final coffeeSizes = ['small', 'large', 'medium'];

    return BlocProvider(
      create: (context) => OrderCubit(),
      child: Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: setWidth(30),
              vertical: setWidth(60),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BuildAppBar(),
                SizedBox(height: setHeight(20)),
                const BuildDeliverPickUp(),
                SizedBox(height: setHeight(20)),
                const LargeText(text: 'Delivery Address'),
                SizedBox(height: setHeight(16)),
                BuildParentChildText(
                  parentText: 'Jl. Kpg Sutoyo',
                  childText: 'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
                  spacing: setHeight(8),
                ),
                SizedBox(height: setHeight(16)),
                Row(
                  children: [
                    const IconTextWidget(
                        text: "Edit Email", iconName: editIcon),
                    SizedBox(width: setWidth(8)),
                    const IconTextWidget(text: "Add Note", iconName: noteIcon),
                  ],
                ),
                SizedBox(height: setHeight(15)),
                const Divider(color: lightGreyColor),
                SizedBox(height: setHeight(15)),
                // add or remove
                const BuildIncreaseDecreaseItem(),
                SizedBox(height: setHeight(15)),
                const Divider(color: lightGreyColor, thickness: 4),
                SizedBox(height: setHeight(20)),
                const BuildDiscountWidget(),
                SizedBox(height: setHeight(15)),
                BuildPaymentSummary(
                  itemPrice: coffee.coffeePrice[coffeeSizes[coffeeSize]]!,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BuildBottomNavBar(),
      ),
    );
  }
}
