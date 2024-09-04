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
class ServiceState extends Equatable {
  final ServiceResponse? apiResponse;
  final String? failureMessage;
  final UIState uiState;

  const ServiceState({
    this.apiResponse,
    this.failureMessage,

    /// making the state loading or idle in first build is up to you
    this.uiState = UIState.inProgress,
  });

  // CopyWith method for state modification
  ServiceState copyWith({
    ServiceResponse? apiResponse,
    String? failureMessage,
    UIState? uiState,
  }) {
    return ServiceState(
      apiResponse: apiResponse ?? this.apiResponse,
      failureMessage: failureMessage ?? this.failureMessage,
      uiState: uiState ?? this.uiState,
    );
  }

  @override
  List<Object?> get props => [apiResponse, uiState, failureMessage];
}
