import 'package:coffee_shop_ui_challenge/src/core/common/utils/assets_names.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/constants.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/data/models/coffee_model.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/cubit/detail_page/detail_cubit.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/widgets/detail_page/build_app_bar.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/widgets/detail_page/build_bottom_nav_bar.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/build_card_image.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/widgets/detail_page/build_decription.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/build_parent_child_text.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/widgets/detail_page/build_row_star.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/widgets/detail_page/build_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  static const String routeName = "/detail";
  final CoffeeModel coffee;

  const DetailPage({Key? key, required this.coffee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setWidth(double width) {
      return ResponsiveLayout.getWidth(width, context);
    }

    double setHeight(double height) {
      return ResponsiveLayout.getHeight(height, context);
    }

    return BlocProvider(
      create: (context) => DetailCubit(),
      child: Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: setWidth(30),
              vertical: setWidth(60),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BuildAppBar(),
                SizedBox(height: setHeight(25)),
                BuildCardImage(image: '$images/${coffee.coffeeImage}'),
                SizedBox(height: setHeight(20)),
                BuildParentChildText(
                  parentText: coffee.coffeeName,
                  childText: coffee.coffeeType,
                  spacing: setHeight(8),
                ),
                BuildRowStar(rate: coffee.coffeeRate),
                const Divider(color: lightGreyColor, thickness: 1),
                SizedBox(height: setHeight(20)),
                BuildDescription(description: coffee.coffeeDescription),
                SizedBox(height: setHeight(20)),
                const BuildSizes(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BuildBottomNavBar(
          coffee: coffee,
        ),
      ),
    );
  }
}
