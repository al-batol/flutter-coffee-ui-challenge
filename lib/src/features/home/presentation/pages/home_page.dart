import 'package:coffee_shop_ui_challenge/src/core/common/utils/constants.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/cubit/base_page/base_page_cubit.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/widgets/home_page/build_app_bar.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/widgets/home_page/build_items.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/widgets/home_page/build_items_chips.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/widgets/home_page/card_widget.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/widgets/home_page/build_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setWidth(double width) {
      return ResponsiveLayout.getWidth(width, context);
    }

    double setHeight(double height) {
      return ResponsiveLayout.getHeight(height, context);
    }

    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            color: const Color(0xFF1D1D1D),
            height: setHeight(280),
          ),
          Padding(
            padding: EdgeInsets.all(setWidth(30)),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: setHeight(30)),
                  const BuildAppBar(),
                  SizedBox(height: setHeight(25)),
                  // search
                  const BuildSearch(),
                  SizedBox(height: setHeight(25)),
                  // card
                  const CardWidget(),
                  SizedBox(height: setHeight(25)),
                  const BuildItemsChips(),
                  SizedBox(height: setHeight(25)),
                  BlocBuilder<BasePageCubit, BasePageState>(
                      builder: (context, state) {
                    return state.dataState == DataStates.loaded
                        ? BuildItems(coffees: state.coffees)
                        : const CircularProgressIndicator(color: primaryColor);
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
