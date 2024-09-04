import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesShimmer extends StatelessWidget {
  const CountriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: SizedBox(
            width: double.infinity,
            height: context.heightPercentage(65), // Fixed height for the card
          ),
        ));
  }
}
