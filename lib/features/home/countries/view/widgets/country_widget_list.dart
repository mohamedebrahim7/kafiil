import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil/features/home/countries/cubit/state.dart';

import '../../cubit/cubit.dart';
import 'countries_error.dart';
import 'countries_shimmer.dart';
import 'country_capital_card.dart';

class CountryWidgetList extends StatelessWidget {
  final CountriesState state;
  const CountryWidgetList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.subUIState == UIState.inProgress) {
      return const CountriesShimmer();
    } else if (state.subUIState == UIState.genericError) {
      return CountriesErrorWidget(
        onPressed: () =>
            context.read<CountriesCubit>().subFetchData(state.currentPage),
      );
    } else if (state.subUIState == UIState.success) {
      final list = state.subApiResponse!.data;
      return CountryCapitalCard(
          data: list.map(
        (e) {
          return CountryCapital(e.name, e.capital);
        },
      ).toList());
    } else {
      return const SizedBox();
    }
  }
}
