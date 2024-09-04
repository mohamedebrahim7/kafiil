import 'package:api_client/api_client.dart';
import 'package:app_theme/app_theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_fields/form_fields.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/navigation/cubits/app_settings_manager_cubit.dart';
import '../../../../../core/navigation/routers/constants.dart';
import 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(const LogInState());

  void goForgetPassword(BuildContext context) {
    context.pushNamed(forgetRoutePath);
  }

  void pushRegister(BuildContext context) {
    context.pushNamed(registerRoutePath);
  }

  void onPasswordChanged(String newValue) {
    final previousScreenState = state;
    final previousPasswordState = previousScreenState.password;
    final shouldValidate = previousPasswordState?.invalid;
    final newPasswordState = shouldValidate ?? false
        ? Password.validated(
            newValue,
          )
        : Password.unvalidated(
            newValue,
          );

    final newScreenState = state.copyWith(
      password: newPasswordState,
    );

    emit(newScreenState);
  }

  void onPasswordUnfocused() {
    final previousScreenState = state;
    final previousPasswordState = previousScreenState.password;
    final previousPasswordValue = previousPasswordState?.value;

    final newPasswordState = Password.validated(
      previousPasswordValue ?? '',
    );
    final newScreenState = previousScreenState.copyWith(
      password: newPasswordState,
    );
    emit(newScreenState);
  }

  void onEmailChanged(String newValue) {
    final previousScreenState = state;
    final previousEmailState = previousScreenState.email;
    final shouldValidate = previousEmailState?.invalid ?? false;
    final newEmailState = shouldValidate
        ? Email.validated(
            newValue,
          )
        : Email.unvalidated(
            newValue,
          );

    final newScreenState = state.copyWith(
      email: newEmailState,
    );

    emit(newScreenState);
  }

  void onEmailUnfocused() {
    final previousScreenState = state;
    final previousEmailState = previousScreenState.email;
    final previousEmailValue = previousEmailState?.value;

    final newEmailState = Email.validated(
      previousEmailValue ?? '',
    );
    final newScreenState = previousScreenState.copyWith(
      email: newEmailState,
    );
    emit(newScreenState);
  }

  void onSubmit(
      {required BuildContext context, required bool remmberMe}) async {
    final password = Password.validated(state.password?.value ?? '');
    final email = Email.validated(state.email?.value ?? '');
    final isFormValid = Formz.validate([password, email]).isValid;

    final newState = state.copyWith(
      password: password,
      email: email,
      submissionStatus: isFormValid ? SubmissionStatus.inProgress : null,
    );

    emit(newState);

    if (isFormValid) {
      try {
        // Example usage of registerUser
        final response = await apiClient.loginUser(loginData: {
          'email': state.email!.value,
          'password': state.password!.value,
        });
        if (response.status == 200) {
          context
              .read<AppSettingsManagerCubit>()
              .goToHome(context, response, remmberMe);
        }
      } on DioException catch (e) {
        if (e.response?.statusCode == 422) {
          final error = e.response.toString();
          RegExp regExp = RegExp(r'\["(.*?)\"]');
          Match? match = regExp.firstMatch(error);

          if (match != null) {
            String extractedData = match.group(1) ?? '';
            context.showErrorSnackBar(extractedData);
          } else {
            context.showErrorSnackBar("invalid_credentials");
          }
        } else {
          context.showErrorSnackBar(e.handleDioError());
        }
        emit(state.copyWith(submissionStatus: SubmissionStatus.genericError));
      } catch (e) {
        context.showErrorSnackBar(e.toString());
        emit(state.copyWith(submissionStatus: SubmissionStatus.genericError));
      }

      // await userRepository.signIn(email.value, password.value,);
    }
  }
}
