import 'package:api_client/api_client.dart';
import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kafiil/features/home/profile/view/profile.dart';
import 'package:kafiil/features/home/service_feature/popular_service_cubit/cubit.dart';
import 'package:kafiil/features/home/service_feature/service_cubit/cubit.dart';
import 'package:kafiil/features/home/service_feature/view/service_screen.dart';

import '../../core/resources/app_strings.dart';
import '../../generated/assets.dart';
import 'countries/cubit/cubit.dart';
import 'countries/view/countries_screen.dart';

class MainRouterScreen extends StatefulWidget {
  final LoginResponse? loginResponse;
  const MainRouterScreen({super.key, this.loginResponse});

  @override
  State<MainRouterScreen> createState() => _MainRouterScreenState();
}

class _MainRouterScreenState extends State<MainRouterScreen> {
  int currentIndex = 0;

  //create a methode that return string due to index of screen in list
  String getScreenName(int index) {
    switch (index) {
      case 0:
        return AppStrings.myVisits;
      case 1:
        return AppStrings.myUnits;
      case 2:
        return AppStrings.more;
      default:
        return AppStrings.myVisits;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(getScreenName(currentIndex),
              style: context.textTheme.headlineLarge)),
      body: Padding(
        padding: context.hPad(Const.scrnPer4),
        child: IndexedStack(
          index: currentIndex,
          children: <Widget>[
            ProfileScreen(
              loginResponse: widget.loginResponse,
            ),
            BlocProvider(
              create: (BuildContext context) => CountriesCubit(),
              child: const CountriesScreen(),
            ),
            MultiBlocProvider(providers: [
              BlocProvider<ServiceCubit>(
                create: (BuildContext context) => ServiceCubit(),
              ),
              BlocProvider<PopularServiceCubit>(
                create: (BuildContext context) => PopularServiceCubit(),
              ),
            ], child: const ServicesScreen())
            //   const MoreScreen()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primary,
        selectedFontSize: 9,
        selectedLabelStyle:
            context.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w500),
        unselectedLabelStyle: context.textTheme.labelSmall,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(Assets.svgIndividualActive),
            icon: SvgPicture.asset(Assets.svgIndividual),
            label: AppStrings.myVisits,
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(Assets.svgCountriesActive),
            icon: SvgPicture.asset(Assets.svgCounties),
            label: AppStrings.myUnits,
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(Assets.svgServiceActive),
            icon: SvgPicture.asset(Assets.svgServices),
            label: AppStrings.more,
          ),
        ],
      ),
    );
  }
}
