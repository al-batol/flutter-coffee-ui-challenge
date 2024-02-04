import 'package:coffee_shop_ui_challenge/src/features/home/data/models/coffee_model.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/pages/detail_page.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/widgets/home_page/item_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildItems extends StatelessWidget {
  final List<CoffeeModel> coffees;

  const BuildItems({Key? key, required this.coffees}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        mainAxisExtent: 256,
      ),
      shrinkWrap: true,
      itemCount: coffees.length,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  DetailPage.routeName,
                  arguments: coffees[index],
                );
              },
              onTapDown: (_) {
                context.read<HomeCubit>().toggleScale(index: index);
              },
              onTapUp: (_) {
                context.read<HomeCubit>().toggleScale();
              },
              onTapCancel: () {
                context.read<HomeCubit>().toggleScale();
              },
              child: Transform.scale(
                scale: state.shouldScale && state.indexItemToScale == index ? 1.1 : 1,
                child: GestureDetector(
                  child: ItemCardWidget(
                    itemName: coffees[index].coffeeName,
                    itemPrice: coffees[index].coffeePrice['large'].toString(),
                    itemRate: coffees[index].coffeeRate,
                    itemType: coffees[index].coffeeType,
                    image: coffees[index].coffeeImage,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
