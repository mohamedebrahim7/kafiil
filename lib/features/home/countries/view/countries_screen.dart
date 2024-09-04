import 'dart:developer';

import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil/features/error_screens/no_internet_widget.dart';
import 'package:kafiil/features/home/countries/view/widgets/country_widget_list.dart';
import 'package:number_paginator/number_paginator.dart';

import '../cubit/cubit.dart';
import '../cubit/state.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
//  int _currentPage = 0;
  final NumberPaginatorController c = NumberPaginatorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CountriesCubit, CountriesState>(
        builder: (context, state) {
          log("🟡🟡🟡 main rebuild🟡🟡🟡");

          if (state.uiState == UIState.inProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.uiState == UIState.genericError) {
            return NoInternetWidget(
              reload: () {
                context.read<CountriesCubit>().fetchData(1);
              },
            );
          } else if (state.uiState == UIState.success) {
            final totalPages = state.apiResponse!.pagination.totalPages;

            return Column(
              children: [
                CountryWidgetList(
                  state: state,
                ),
                context.hSBox(Const.scrnPer2),
                NumberPaginator(
                  controller: c,
                  config: NumberPaginatorUIConfig(
                    buttonSelectedForegroundColor: Colors.white,
                    buttonSelectedBackgroundColor: AppColors.primary,
                    buttonUnselectedBackgroundColor: Colors.white,
                    buttonUnselectedForegroundColor: Colors.black,
                    buttonTextStyle: context.textTheme.headlineMedium
                        ?.copyWith(fontSize: context.heightPercentage(2.2)),

                    height: context.heightPercentage(6),
                    buttonShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Color(0xffE6EAEF)),
                    ),
                    // contentPadding: const EdgeInsets.all(0),
                  ),
                  nextButtonBuilder: (context) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: c.currentPage == totalPages - 1
                              ? null
                              : () {
                                  c.next();
                                },
                          child: DecoratedBox(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xffE6EAEF)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SizedBox(
                                height: context.heightPercentage(4),
                                width: context.heightPercentage(4),
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: c.currentPage == totalPages - 1
                                      ? Colors.grey
                                      : Colors.black,
                                  // size: context.heightPercentage(5.5),
                                ),
                              )),
                        ),
                        InkWell(
                          onTap: c.currentPage == totalPages - 1
                              ? null
                              : () {
                                  c.navigateToPage(totalPages - 1);
                                },
                          child: DecoratedBox(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xffE6EAEF)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SizedBox(
                                height: context.heightPercentage(4),
                                width: context.heightPercentage(4),
                                child: Icon(
                                  Icons.keyboard_double_arrow_right,
                                  color: c.currentPage == totalPages - 1
                                      ? Colors.grey
                                      : Colors.black,
                                  // size: context.heightPercentage(5.5),
                                ),
                              )),
                        ),
                      ],
                    );
                  },
                  prevButtonBuilder: (context) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: c.currentPage == 0
                              ? null
                              : () {
                                  c.navigateToPage(0);
                                },
                          child: DecoratedBox(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xffE6EAEF)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SizedBox(
                                height: context.heightPercentage(4),
                                width: context.heightPercentage(4),
                                child: Icon(
                                  Icons.keyboard_double_arrow_left,
                                  color: c.currentPage == 0
                                      ? Colors.grey
                                      : Colors.black,
                                  // size: context.heightPercentage(5.5),
                                ),
                              )),
                        ),
                        InkWell(
                          onTap: c.currentPage == 0
                              ? null
                              : () {
                                  c.prev();
                                },
                          child: DecoratedBox(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xffE6EAEF)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SizedBox(
                                height: context.heightPercentage(4),
                                width: context.heightPercentage(4),
                                child: Icon(
                                  Icons.keyboard_arrow_left,
                                  color: c.currentPage == 0
                                      ? Colors.grey
                                      : Colors.black,
                                  // size: context.heightPercentage(5.5),
                                ),
                              )),
                        ),
                      ],
                    );
                  },
                  numberPages: totalPages,
                  onPageChange: (int index) {
                    context.read<CountriesCubit>().onPageChange(index);
                  },
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      // card for elevation
    );
  }
}
