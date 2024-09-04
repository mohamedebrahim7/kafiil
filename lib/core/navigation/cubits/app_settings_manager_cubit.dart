import 'dart:io';

import 'package:api_client/api_client.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../routers/constants.dart';
import 'app_settings_manager_state.dart';

class AppSettingsManagerCubit extends HydratedCubit<AppSettingsManagerState> {
  AppSettingsManagerCubit() : super(const AppSettingsManagerState());

  @override
  AppSettingsManagerState fromJson(Map<String, dynamic> json) {
    return AppSettingsManagerState(
        navigationState: NavigationState.values[json['navigationState'] as int],
        isDarkModeEnabled: json['isDarkModeEnabled'] as bool,
        loginResponse: LoginResponse.fromJson(json['userData']));
  }

  @override
  Map<String, dynamic> toJson(AppSettingsManagerState state) {
    return {
      'userData': state.loginResponse?.toJson() ?? LoginResponse(),
      'navigationState': state.navigationState.index,
      'isDarkModeEnabled': state.isDarkModeEnabled,
    };
  }

  // Calling goToLogin will set the login screen as the initial screen of the app
  // and remove any existing routes, ensuring a clean navigation flow.
  // This method effectively resets the app's navigation stack to the login screen,
  // allowing users to begin the login process from the start.
  void goToLogin(BuildContext context) {
    emit(state.copyWith(
      navigationState: NavigationState.onLogin,
    ));
    context.go(loginRoutePath);
  }

  void goToHome(
      BuildContext context, LoginResponse loginResponse, bool rememberMe) {
    if (rememberMe) {
      emit(state.copyWith(
          navigationState: NavigationState.onHome,
          loginResponse: loginResponse));
      context.pushReplacement(
        mainTabRouterRoutePath,
      );
    } else {
      context.pushReplacement(
        extra: loginResponse,
        mainTabRouterRoutePath,
      );
    }
  }

  ///change the theme of the app
  void changeThemeMode() {
    emit(state.copyWith(isDarkModeEnabled: !state.isDarkModeEnabled));
  }

  Future<void> editProfile({required BuildContext context}) async {
/*
    emit(state.copyWith(editProfileStatus: EditProfileStatus.loading));
    var result = await _editProfileRepo.editProfile(
        context: context, editProfileRequestModel: editProfileRequestModel);
    result.fold((error) {
      emit(state.copyWith(
          editProfileStatus: EditProfileStatus.error, message: error.message));
    }, (userModel) {
      emit(state.copyWith(
          editProfileStatus: EditProfileStatus.success,
          userData: userModel.data,
          message: userModel.message));
    });
*/
  }

  Future<void> getProfile({required BuildContext context}) async {
/*
    emit(state.copyWith(profileStatus: EditProfileStatus.loading));
    var result = await _editProfileRepo.getProfile(
      context: context,
    );
    result.fold((error) {
      emit(state.copyWith(
          profileStatus: EditProfileStatus.error, message: error.message));
    }, (userModel) {
      emit(state.copyWith(
          profileStatus: EditProfileStatus.success,
          userData: userModel.data,
          message: userModel.message));
    });
*/
  }

  File? profileImage;
  File? image;
  Future<void> removeCoverImage({required BuildContext context}) async {
/*
    emit(state.copyWith(removeImageStatus: EditProfileStatus.loading));
    var result = await _editProfileRepo.removeCoverImage(context: context);
    result.fold((error) {
      emit(state.copyWith(
          removeImageStatus: EditProfileStatus.error, message: error.message));
    }, (userModel) {
      emit(state.copyWith(
          removeImageStatus: EditProfileStatus.success,
          userData: userModel.data,
          message: userModel.message));
    });
*/
  }
}

// Define the custom Cubit observer
