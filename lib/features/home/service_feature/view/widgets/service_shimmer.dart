import 'package:flutter/material.dart';
import 'package:kafiil/features/home/service_feature/view/service_screen.dart';
import 'package:shimmer/shimmer.dart';

class ServiceShimmer extends StatelessWidget {
  const ServiceShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10, // Adjust the number of shimmer items
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const ProductCard(
              image: "image",
              price: "price",
              title: "title",
              rating: 0,
              reviewCount: 0);
        },
      ),
    );
  }
}
