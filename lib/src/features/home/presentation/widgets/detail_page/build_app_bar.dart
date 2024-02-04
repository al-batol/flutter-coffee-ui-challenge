import 'package:coffee_shop_ui_challenge/src/core/common/utils/assets_names.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/big_text.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/svg_icon.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/cubit/detail_page/detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildAppBar extends StatelessWidget {
  const BuildAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setWidth(double width) {
      return ResponsiveLayout.getWidth(width, context);
    }

    final double iconSize = setWidth(24);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            size: iconSize,
          ),
        ),
        const BigText(text: 'Detail'),
        BlocBuilder<DetailCubit, DetailStates>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                context.read<DetailCubit>().toggleFavorite(!state.isFavorite);
              },
              child: SvgIcon(
                svgName: state.isFavorite ? favoriteIcon : heart2Icon,
                size: iconSize,
              ),
            );
          },
        ),
      ],
    );
  }
}
