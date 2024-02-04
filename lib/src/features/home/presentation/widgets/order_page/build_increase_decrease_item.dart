import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/build_card_image.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/build_parent_child_text.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/cubit/order_page/order_cubit.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/widgets/order_page/add_remove_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildIncreaseDecreaseItem extends StatelessWidget {
  const BuildIncreaseDecreaseItem({Key? key}) : super(key: key);

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

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const BuildCardImage(isSmall: true),
            SizedBox(width: setWidth(12)),
            BuildParentChildText(
              parentText: 'Cappucino',
              childText: 'with Chocolate',
              spacing: setHeight(4),
            ),
          ],
        ),
        const Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AddRemoveContainer(isAdd: false),
              BlocBuilder<OrderCubit, OrderStates>(
                builder: (context, state) {
                  return Text(
                    state.counter.toString(),
                    style: TextStyle(
                      fontSize: setFontSize(10),
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  );
                },
              ),
              const AddRemoveContainer(isAdd: true),
            ],
          ),
        ),
      ],
    );
  }
}
