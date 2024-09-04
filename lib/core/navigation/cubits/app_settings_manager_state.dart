import 'package:api_client/api_client.dart';
import 'package:equatable/equatable.dart';

enum NavigationState { onLogin, onHome }

enum EditProfileStatus { initial, loading, success, error }

class AppSettingsManagerState extends Equatable {
  final NavigationState navigationState;
  final bool isDarkModeEnabled;
  final String? message;
  final LoginResponse? loginResponse;

  // Default constructor with default values
  const AppSettingsManagerState(
      {this.message,
      this.navigationState = NavigationState.onLogin,
      this.isDarkModeEnabled = false,
      this.loginResponse});

  AppSettingsManagerState copyWith({
    LoginResponse? loginResponse,
    String? message,
    NavigationState? navigationState,
    bool? isDarkModeEnabled,
  }) {
    return AppSettingsManagerState(
      loginResponse: loginResponse ?? this.loginResponse,
      message: message ?? this.message,
      navigationState: navigationState ?? this.navigationState,
      isDarkModeEnabled: isDarkModeEnabled ?? this.isDarkModeEnabled,
    );
  }

  @override
  List<Object?> get props =>
      [loginResponse, message, navigationState, isDarkModeEnabled];
}
