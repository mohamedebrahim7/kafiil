import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_fields/form_fields.dart';

import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(const ForgetPasswordState());
  void onPhoneChanged(String newValue) {
    final previousScreenState = state;
    final previousPasswordState = previousScreenState.phone;
    final shouldValidate = previousPasswordState.invalid;
    final newPasswordState = shouldValidate
        ? Phone.validated(
            newValue,
          )
        : Phone.unvalidated(
            newValue,
          );

    final newScreenState = state.copyWith(
      phone: newPasswordState,
    );

    emit(newScreenState);
  }

  void onPhoneUnfocused() {
    final previousScreenState = state;
    final previousPasswordState = previousScreenState.phone;
    final previousPasswordValue = previousPasswordState.value;

    final newPasswordState = Phone.validated(
      previousPasswordValue,
    );
    final newScreenState = previousScreenState.copyWith(
      phone: newPasswordState,
    );
    emit(newScreenState);
  }

  void onSubmit(BuildContext context) async {
    final phone = Phone.validated(state.phone.value);

    final isFormValid = Formz.validate([phone]).isValid;

    final newState = state.copyWith(
      phone: phone,
      submissionStatus: isFormValid ? SubmissionStatus.inProgress : null,
    );

    emit(newState);

    if (isFormValid) {}
  }
}
