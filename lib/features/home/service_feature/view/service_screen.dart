import 'package:app_theme/app_theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafiil/features/home/service_feature/view/widgets/service_error.dart';
import 'package:kafiil/features/home/service_feature/view/widgets/service_shimmer.dart';

import '../../../../../../core/navigation/cubits/app_settings_manager_cubit.dart';
import '../../../../../../generated/assets.dart';
import '../popular_service_cubit/cubit.dart';
import '../popular_service_cubit/state.dart';
import '../service_cubit/cubit.dart';
import '../service_cubit/state.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
              height: context.heightPercentage(32),
              child: BlocBuilder<ServiceCubit, ServiceState>(
                builder: (context, state) {
                  if (state.uiState == UIState.inProgress) {
                    return const ServiceShimmer();
                  } else if (state.uiState == UIState.genericError) {
                    return ServiceError(
                      onPressed: () => context.read<ServiceCubit>().fetchData(),
                    );
                  } else if (state.uiState == UIState.success) {
                    final serviceList = state.apiResponse!.data;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: serviceList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final service = serviceList[index];
                        return ProductCard(
                          image: service.mainImage,
                          price: service.price.toString(),
                          title: service.title,
                          rating: service.averageRating,
                          reviewCount: service.completedSalesCount,
                        );
                      },
                    );
                  } else {
                    return Container(); // Handle any other case if necessary
                  }
                },
              )),
          context.hSBox(Const.scrnPer3),
          Text(
            "Popular Services",
            style: context.textTheme.headlineLarge,
          ),
          context.hSBox(Const.scrnPer3),
          SizedBox(
              height: context.heightPercentage(32),
              child: BlocBuilder<PopularServiceCubit, PopularServiceState>(
                builder: (context, state) {
                  if (state.uiState == PopularServiceUIState.inProgress) {
                    return const ServiceShimmer();
                  } else if (state.uiState ==
                      PopularServiceUIState.genericError) {
                    return ServiceError(
                      onPressed: () =>
                          context.read<PopularServiceCubit>().fetchData(),
                    );
                  } else if (state.uiState == PopularServiceUIState.success) {
                    final serviceList = state.apiResponse!.data;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: serviceList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final service = serviceList[index];
                        return ProductCard(
                          image: service.mainImage,
                          price: service.price.toString(),
                          title: service.title,
                          rating: service.averageRating,
                          reviewCount: service.completedSalesCount,
                        );
                      },
                    );
                  } else {
                    return Container(); // Handle any other case if necessary
                  }
                },
              )),
          context.hSBox(Const.scrnPer15),
          ElevatedButton(
            onPressed: () {
              context.read<AppSettingsManagerCubit>().goToLogin(context);
            },
            child: const Text('Logout'),
          )
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String price;
  final String title;
  final int rating;
  final int reviewCount;

  const ProductCard({
    super.key,
    required this.image,
    required this.price,
    required this.title,
    required this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.heightPercentage(30),
      width: context.widthPercentage(42),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 4.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Stack(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        child: CachedNetworkImage(
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          imageUrl: image,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Container(
                              color: Colors.grey,
                              child: const Icon(Icons.error)),
                        )),
                    Positioned(
                      bottom: context.widthPercentage(2),
                      left: context.widthPercentage(2),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.widthPercentage(4),
                            vertical: context.heightPercentage(1)),
                        decoration: const ShapeDecoration(
                            color: AppColors.primary, shape: StadiumBorder()),
                        child: Text(
                          "\$$price",
                          style: context.textTheme.headlineMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /**/
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    context.hSBox(1),
                    AutoSizeText(
                      maxLines: 2,
                      title,
                      style: context.textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 12.0),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Color(0xFFFFCB31),
                            size: 16.0,
                          ),
                          context.wSBox(0.5),
                          Text(
                            "($rating)",
                            style: context.textTheme.headlineSmall?.copyWith(
                              color: const Color(0xFFFFCB31),
                            ),
                          ),
                          context.wSBox(1),
                          Container(
                            color: const Color(0xFFC3C5C8),
                            width: context.widthPercentage(0.3),
                            height: context.heightPercentage(2),
                          ),
                          context.wSBox(1),
                          SvgPicture.asset(
                            Assets.svgGrocery,
                          ),
                          context.wSBox(0.5),
                          Text(
                            reviewCount.toString(),
                            style: context.textTheme.headlineSmall?.copyWith(
                              color: const Color(0xFF828282),
                            ),
                          ),
                          context.wSBox(2),
                        ],
                      ),
                    ),
                    context.hSBox(Const.scrnPer2)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
