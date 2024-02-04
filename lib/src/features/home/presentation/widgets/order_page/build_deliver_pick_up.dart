import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/item_chip_widget.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/cubit/order_page/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildDeliverPickUp extends StatelessWidget {
  const BuildDeliverPickUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setWidth(double width) {
      return ResponsiveLayout.getWidth(width, context);
    }

    double setHeight(double height) {
      return ResponsiveLayout.getHeight(height, context);
    }

    return Container(
      height: setHeight(58),
      padding: EdgeInsets.all(setWidth(4)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Color(0xFFF2F2F2),
      ),
      child: BlocBuilder<OrderCubit, OrderStates>(
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    context
                        .read<OrderCubit>()
                        .toggleDeliverOrPickUp(true);
                  },
                  child: CustomButton(
                    itemName: 'Deliver',
                    isTransparent: !state.deliverOrPickUp,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    context
                        .read<OrderCubit>()
                        .toggleDeliverOrPickUp(false);
                  },
                  child: CustomButton(
                    itemName: 'Pickup',
                    isTransparent: state.deliverOrPickUp,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
