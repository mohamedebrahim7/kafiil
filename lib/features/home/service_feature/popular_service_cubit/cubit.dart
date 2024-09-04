import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class PopularServiceCubit extends Cubit<PopularServiceState> {
  PopularServiceCubit() : super(const PopularServiceState()) {
    /// you can use fetch data to fetch data directly
    /// remove it  if you want to wait until user ask for it
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      emit(state.copyWith(uiState: PopularServiceUIState.inProgress));
      //delayy 2 second
      final response = await apiClient.getPopularServices();
      if (response.status == 200) {
        emit(state.copyWith(
          uiState: PopularServiceUIState.success,
          apiResponse: response,
        ));
      } else {
        emit(
          state.copyWith(uiState: PopularServiceUIState.genericError),
        );
      }
    } on DioException catch (e) {
      emit(state.copyWith(
          uiState: PopularServiceUIState.genericError,
          failureMessage: e.handleDioError()));
    }
  }
}
