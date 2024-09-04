import 'package:api_client/api_client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil/features/home/countries/cubit/state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit() : super(CountriesState()) {
    /// you can use fetch data to fetch data directly
    /// remove it  if you want to wait until user ask for it
    fetchData(1);
  }

  Future<void> fetchData(int page) async {
    try {
      emit(state.copyWith(uiState: UIState.inProgress));
      final response = await apiClient.getCountries(page: page);

      if (response.status == 200) {
        emit(state.copyWith(
          uiState: UIState.success,
          apiResponse: response,
          subApiResponse: response,
        ));
      } else {
        emit(state.copyWith(
          uiState: UIState.genericError,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        uiState: UIState.genericError,
      ));
    }
  }

  Future<void> subFetchData(int page) async {
    try {
      emit(state.copyWith(subUIState: UIState.inProgress));
      final response = await apiClient.getCountries(page: page);
      if (response.status == 200) {
        emit(state.copyWith(
          subUIState: UIState.success,
          subApiResponse: response,
        ));
      } else {
        emit(state.copyWith(
          subUIState: UIState.genericError,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        subUIState: UIState.genericError,
      ));
    }
  }

//  final Function(int)? onPageChange;

  void onPageChange(int page) {
    // emit(state.copyWith(currentPage: page));
    // fetchData(page + 1);
    subFetchData(page + 1);
  }
}
