import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../generated/assets.dart';

class CheckboxRow extends StatelessWidget {
  final bool isChecked;
  final String svgAsset;
  final String text;
  final ValueChanged<bool?>? onChanged;

  const CheckboxRow({
    super.key,
    required this.isChecked,
    required this.svgAsset,
    required this.text,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
        ),
        context.wSBox(Const.scrnPer2),
        SvgPicture.asset(
          svgAsset,
          width: context.heightPercentage(3),
          height: context.heightPercentage(3),
        ),
        const SizedBox(width: 8.0),
        Text(
          text,
          style: context.textTheme.headlineMedium
              ?.copyWith(fontSize: context.heightPercentage(2.2)),
        ),
      ],
    );
  }
}

String getSocialMediaIcon(String label) {
  switch (label) {
    case 'facebook':
      return Assets.svgFacebook;
    case 'x':
      return Assets.svgX;
    case 'linkedIn':
      return Assets.svgLinkedin;
    case 'instagram':
      return Assets.svgInsta;
    case 'twitter':
      return Assets.svgTwitter;
    default:
      return "";
  }
}
