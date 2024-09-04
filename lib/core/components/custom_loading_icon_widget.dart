import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:kafiil/generated/assets.dart';
import 'package:lottie/lottie.dart';

class CustomLoadingIcon extends StatelessWidget {
  const CustomLoadingIcon({super.key, this.heightPercentage});
  final double? heightPercentage;
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      Assets.loadingIcon,
      height: context.heightPercentage(heightPercentage ?? 2.5),
      fit: BoxFit.fill,
    );
  }
}
