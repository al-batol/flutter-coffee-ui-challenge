import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/data/data_sources/coffee_data.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/item_chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildItemsChips extends StatelessWidget {
  const BuildItemsChips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setWidth(double width) {
      return ResponsiveLayout.getWidth(width, context);
    }

    double setHeight(double height) {
      return ResponsiveLayout.getHeight(height, context);
    }

    return SizedBox(
      width: ResponsiveLayout.screenWidth(context) - setWidth(60),
      height: setHeight(48),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: coffeeTypes.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.read<HomeCubit>().setItemNumber(index);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    right: index != 5 ? setWidth(10) : 0,
                  ),
                  child: CustomButton(
                    isSelected: index == state.itemNumber ? true : false,
                    itemName: coffeeTypes[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
