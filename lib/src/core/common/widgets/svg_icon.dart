import 'package:coffee_shop_ui_challenge/src/core/common/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String svgName;
  final double size;
  final bool? isEnabled;
  final bool? shouldAnimate;

  const SvgIcon({
    Key? key,
    required this.svgName,
    required this.size,
    this.isEnabled,
    this.shouldAnimate = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isColored = isEnabled ?? false;
    return shouldAnimate!
        ? AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: size,
            height: size,
            child: SvgPicture.asset(
              svgName,
              colorFilter: isColored
                  ? const ColorFilter.mode(primaryColor, BlendMode.srcIn)
                  : null,
            ),
          )
        : SvgPicture.asset(
            svgName,
            width: size,
            height: size,
            colorFilter: isColored
                ? const ColorFilter.mode(primaryColor, BlendMode.srcIn)
                : null,
          );
  }
}
