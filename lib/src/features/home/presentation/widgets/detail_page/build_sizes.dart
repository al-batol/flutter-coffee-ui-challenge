import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/big_text.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/cubit/detail_page/detail_cubit.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/widgets/detail_page/letter_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildSizes extends StatelessWidget {
  const BuildSizes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setWidth(double width) {
      return ResponsiveLayout.getWidth(width, context);
    }

    double setHeight(BuildContext context, double height) {
      return ResponsiveLayout.getHeight(height, context);
    }

    final letters = [
      'S',
      'L',
      'M',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BigText(text: 'Size'),
        SizedBox(height: setHeight(context, 12)),
        Row(
          children: [
            ...List.generate(
              letters.length,
              (index) => Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    right: index != letters.length - 1 ? setWidth(12) : 0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      context.read<DetailCubit>().changeCoffeeSize(index);
                    },
                    child: BlocBuilder<DetailCubit, DetailStates>(
                      builder: (context, state) {
                        return LetterChip(
                          letter: letters[index],
                          isEnabled: state.coffeeSize == index,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
