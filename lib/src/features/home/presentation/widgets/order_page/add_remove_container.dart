import 'package:coffee_shop_ui_challenge/src/core/common/utils/constants.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/cubit/order_page/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRemoveContainer extends StatelessWidget {
  final bool isAdd;

  const AddRemoveContainer({Key? key, required this.isAdd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setWidth(double width) {
      return ResponsiveLayout.getWidth(width, context);
    }

    return GestureDetector(
      onTap: () {
        if (isAdd) {
          context.read<OrderCubit>().increase();
        } else {
          context.read<OrderCubit>().decrease();
        }
      },
      child: Container(
        padding: EdgeInsets.all(setWidth(6)),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: lightGreyColor)),
        child: Icon(
          isAdd ? Icons.add : Icons.remove,
          size: setWidth(24),
          color: const Color(0xFFAAADB0),
        ),
      ),
    );
  }
}
