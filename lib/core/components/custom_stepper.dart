import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomStepper extends StatelessWidget {
  final bool go2nd;
  const CustomStepper({super.key, required this.go2nd});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: SizedBox()),
            context.wSBox(7),
            Container(
              child: Text(
                'Register',
                style: GoogleFonts.montserrat(
                    fontSize: context.heightPercentage(2),
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary),
              ),
            ),
            const Expanded(child: SizedBox()),
            Container(
              child: Text(
                'Complete Data',
                style: GoogleFonts.montserrat(
                    fontSize: context.heightPercentage(2),
                    fontWeight: go2nd ? FontWeight.w600 : FontWeight.w500,
                    color: go2nd ? AppColors.primary : AppColors.textDisabled),
              ),
            ),
            const Expanded(child: SizedBox())
          ],
        ),
        context.hSBox(Const.scrnPer2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
              height: context.heightPercentage(.4),
              color: AppColors.primary,
            )),
            go2nd
                ? Container(
                    height: context.heightPercentage(5),
                    width: context.heightPercentage(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  )
                : Container(
                    height: context.heightPercentage(5),
                    width: context.heightPercentage(5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primary, width: 3),
                    ),
                    child: Text(
                      "1",
                      style: GoogleFonts.montserrat(
                          fontSize: context.heightPercentage(2.5),
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary),
                    ),
                  ),
            Expanded(
                child: Container(
              height: context.heightPercentage(.4),
              color: go2nd ? AppColors.primary : AppColors.disabled,
            )),
            go2nd
                ? Container(
                    height: context.heightPercentage(5),
                    width: context.heightPercentage(5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primary, width: 3),
                    ),
                    child: Text(
                      "2",
                      style: GoogleFonts.montserrat(
                          fontSize: context.heightPercentage(2.5),
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary),
                    ),
                  )
                : Container(
                    height: context.heightPercentage(5),
                    width: context.heightPercentage(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.disabled,
                    ),
                  ),
            Expanded(
                child: Container(
              height: context.heightPercentage(.4),
              color: AppColors.disabled,
            )),
          ],
        ),
      ],
    );
  }
}
