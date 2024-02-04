import 'package:coffee_shop_ui_challenge/src/core/common/utils/assets_names.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/constants.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/utils/responsive_layout.dart';
import 'package:coffee_shop_ui_challenge/src/core/common/widgets/svg_icon.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/cubit/base_page/base_page_cubit.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasePage extends StatelessWidget {
  static const String routeName = "/";

  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double setWidth(double width) {
      return ResponsiveLayout.getWidth(width, context);
    }

    double setHeight(double height) {
      return ResponsiveLayout.getHeight(height, context);
    }

    double borderRadius = setWidth(30);

    final navIcons = [
      homeIcon,
      heartIcon,
      bagIcon,
      notificationIcon,
    ];
    return Scaffold(
      backgroundColor: bgColor,
      body: const HomePage(),
      bottomNavigationBar: Container(
        height: setHeight(99),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius),
          ),
          color: Colors.white,
        ),
        child: BlocBuilder<BasePageCubit, BasePageState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...List.generate(
                  navIcons.length,
                  (index) => GestureDetector(
                    onTap: () {
                      context.read<BasePageCubit>().changePage(index);
                    },
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: setHeight(15)),
                          child: SvgIcon(
                            shouldAnimate: true,
                            // sorry for this but the svg of home is large and i tried to reduce the size
                            size: index == state.currentPage
                                ? index == 0
                                    ? setWidth(30)
                                    : setWidth(35)
                                : index == 0
                                    ? setWidth(24)
                                    : setWidth(30),
                            svgName: navIcons[index],
                            isEnabled: index == state.currentPage,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: AnimatedOpacity(
                            opacity: index == state.currentPage ? 1 : 0,
                            duration: const Duration(milliseconds: 200),
                            child: Container(
                              margin:
                                  EdgeInsets.symmetric(horizontal: setWidth(8)),
                              height: setHeight(5),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFEDAB81),
                                    Color(0xFFC67C4E),
                                  ],
                                ),
                                borderRadius:
                                    BorderRadius.circular(setWidth(10)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
