import 'package:coffee_shop_ui_challenge/src/core/common/utils/constants.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/big_text.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/cubit/detail_page/detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildDescription extends StatelessWidget {
  final String description;

  const BuildDescription({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setHeight(BuildContext context, double height) {
      return ResponsiveLayout.getHeight(height, context);
    }

    double setFontSize(BuildContext context, double fontSize) {
      return ResponsiveLayout.getFontSize(fontSize, context);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BigText(text: 'Description'),
        SizedBox(height: setHeight(context, 12)),
        BlocBuilder<DetailCubit, DetailStates>(
          builder: (context, state) {
            String text = '';
            if (description.length > 116) {
              text = description.substring(
                  0, (state.willNotReadMore ? 116 : description.length));
              text += state.willNotReadMore ? '...' : '';
            } else {
              text = description;
            }

            return RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: setFontSize(context, 12.5),
                  height: setFontSize(context, 1),
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF9B9B9B),
                ),
                text: text,
                children: [
                  const WidgetSpan(child: SizedBox(width: 5)),
                  if (description.length > 116)
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: GestureDetector(
                        onTap: () {
                          context.read<DetailCubit>().toggleReadMore();
                        },
                        child: Text(
                          state.willNotReadMore ? 'Read more' : 'Read less',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: setFontSize(context, 11),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                ],
              ),
            );
          },
        ),
        // Text(
        //   description.substring(0, 116),
        //   style: TextStyle(
        //     fontSize: setFontSize(context, 11.5),
        //     height: setFontSize(context, 1),
        //     fontWeight: FontWeight.w400,
        //     color: Color(0xFF9B9B9B),
        //   ),
        // ),
      ],
    );
  }
}
