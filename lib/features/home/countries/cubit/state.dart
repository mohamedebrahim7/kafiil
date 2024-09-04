import 'package:api_client/api_client.dart';
import 'package:equatable/equatable.dart';

// Define the enum for API states
enum UIState {
  inProgress,

  /// Used to close the screen and navigate back to the caller screen.
  success,

  /// Used to display a generic snack bar saying that an error has occurred, e.g., no internet connection.
  genericError,
}

// Define your Cubit state
class CountriesState extends Equatable {
  final CountryResponse? apiResponse;
  final CountryResponse? subApiResponse;
  final String? failureMessage;
  final UIState uiState;
  final UIState subUIState;
  int currentPage;

  CountriesState(
      {this.apiResponse,
      this.failureMessage,
      this.uiState = UIState.inProgress,
      this.subUIState = UIState.success,
      this.subApiResponse,
      this.currentPage = 0});

  // CopyWith method for state modification
  CountriesState copyWith({
    CountryResponse? apiResponse,
    CountryResponse? subApiResponse,
    String? failureMessage,
    UIState? uiState,
    UIState? subUIState,
    int? currentPage,
  }) {
    return CountriesState(
      apiResponse: apiResponse ?? this.apiResponse,
      subApiResponse: subApiResponse ?? this.subApiResponse,
      failureMessage: failureMessage ?? this.failureMessage,
      uiState: uiState ?? this.uiState,
      subUIState: subUIState ?? this.subUIState,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object?> get props => [
        apiResponse,
        uiState,
        failureMessage,
        currentPage,
        subApiResponse,
        subUIState
      ];
}
