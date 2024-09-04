import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../generated/assets.dart';

class NoInternetWidget extends StatelessWidget {
  final VoidCallback? reload;
  const NoInternetWidget({super.key, this.reload});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SvgPicture.asset(
        Assets.svgNoInternet,
        height: context.heightPercentage(30),
      ),
      context.hSBox(2),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * .2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "No internet connection",
              style: context.textTheme.headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            context.hSBox(2),
            Text(
              "Please check your internet connection",
              style: context.textTheme.bodyMedium!
                  .copyWith(color: AppColors.textFiledLabel),
              textAlign: TextAlign.center,
            ),
            context.hSBox(2.5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * .1),
              child: SizedBox(
                height: 45,
                child: ElevatedButton(
                  onPressed: reload,
                  style: ElevatedButton.styleFrom(
                    // fixedSize: const Size(double.infinity, 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: context.height * .018),
                  ),
                  child: const Text("Reload"),
                ),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
