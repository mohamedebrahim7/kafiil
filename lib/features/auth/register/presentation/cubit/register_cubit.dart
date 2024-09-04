import 'dart:developer';
import 'dart:io';

import 'package:api_client/api_client.dart';
import 'package:app_theme/app_theme.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_fields/form_fields.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:kafiil/features/auth/register/presentation/cubit/register_state.dart';
import 'package:textfield_tags/src/controller.dart';

import '../../../../../core/navigation/routers/constants.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState()) {
    fetchData();
  }

  Future<void> fetchData() async {
    prettyDioLogger();
    try {
      emit(state.copyWith(submissionStatus: SubmissionStatus.inProgress));

      final response = await apiClient.getDependencies();

      if (response.status == 200) {
        emit(state.copyWith(
          submissionStatus: SubmissionStatus.idle,
          dependenciesResponse: response,
        ));
      } else {
        emit(state.copyWith(
          submissionStatus: SubmissionStatus.invalidCredentialsError,
          message: "an error occurred",
        ));
      }
    } on DioException catch (e) {
      emit(state.copyWith(
          submissionStatus: SubmissionStatus.invalidCredentialsError,
          message: e.handleDioError()));
    }
  }

  List<DropDownValueModel> convertToDropDownValueModel(
      List<DependencyType> dependencyList) {
    return dependencyList.map((dependency) {
      return DropDownValueModel(
          value: dependency.value, name: dependency.label);
    }).toList();
  }

  void goLogin(BuildContext context) {
    context.pop(context);
  }

  void onDropdownChanged(DropDownValueModel? newValue) {
    final newDropdownState = Dropdown.validated(newValue);
    emit(state.copyWith(userType: newDropdownState));
  }

  // Handle birth date changed
  void onBirthDateChanged(DateTime birthDate) {
    final date = Date.validated(birthDate);
    emit(state.copyWith(birthDate: date));
  }

  void onFirstnameChanged(String newValue) {
    final previousScreenState = state;
    final previousFirstnameState = previousScreenState.firstname;
    final shouldValidate = previousFirstnameState.invalid;
    final newFirstnameState = shouldValidate
        ? Username.validated(
            newValue,
          )
        : Username.unvalidated(
            newValue,
          );

    final newScreenState = state.copyWith(
      firstname: newFirstnameState,
    );

    emit(newScreenState);
  }

  void onAboutChanged(String newValue) {
    final previousScreenState = state;
    final previousAboutState = previousScreenState.about;
    final shouldValidate = previousAboutState.invalid;
    final newAboutState = shouldValidate
        ? About.validated(newValue)
        : About.unvalidated(newValue);

    final newScreenState = state.copyWith(
      about: newAboutState,
    );

    emit(newScreenState);
  }

  void onAboutUnfocused() {
    final previousScreenState = state;
    final previousAboutState = previousScreenState.about;
    final previousAboutValue = previousAboutState.value;

    final newAboutState = About.validated(previousAboutValue);
    final newScreenState = previousScreenState.copyWith(
      about: newAboutState,
    );
    emit(newScreenState);
  }

  void onLastnameChanged(String newValue) {
    final previousScreenState = state;
    final previousLastnameState = previousScreenState.lastname;
    final shouldValidate = previousLastnameState.invalid;
    final newLastnameState = shouldValidate
        ? Username.validated(
            newValue,
          )
        : Username.unvalidated(
            newValue,
          );

    final newScreenState = state.copyWith(
      lastname: newLastnameState,
    );

    emit(newScreenState);
  }

  void onEmailChanged(String newValue) {
    final previousScreenState = state;
    final previousEmailState = previousScreenState.email;
    final shouldValidate = previousEmailState.invalid;
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

  void onPasswordChanged(String newValue) {
    final previousScreenState = state;
    final previousPasswordState = previousScreenState.password;
    final shouldValidate = previousPasswordState.invalid;
    final newPasswordState = shouldValidate
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

  void onPasswordConfirmationChanged(String newValue) {
    final previousPasswordState = state.passwordConfirmation;
    final shouldValidate = previousPasswordState.invalid;
    final newPasswordConfirmationState = shouldValidate
        ? PasswordConfirmation.validated(
            newValue,
            password: state.password,
          )
        : PasswordConfirmation.unvalidated(
            newValue,
          );

    final newScreenState = state.copyWith(
      passwordConfirmation: newPasswordConfirmationState,
    );

    emit(newScreenState);
  }

  void onFirstnameUnfocused() {
    final previousScreenState = state;
    final previousFirstnameState = previousScreenState.firstname;
    final previousFirstnameValue = previousFirstnameState.value;

    final newFirstnameState = Username.validated(
      previousFirstnameValue,
    );
    final newScreenState = previousScreenState.copyWith(
      firstname: newFirstnameState,
    );
    emit(newScreenState);
  }

  void onLastnameUnfocused() {
    final previousScreenState = state;
    final previousLastnameState = previousScreenState.lastname;
    final previousLastnameValue = previousLastnameState.value;

    final newLastnameState = Username.validated(
      previousLastnameValue,
    );
    final newScreenState = previousScreenState.copyWith(
      lastname: newLastnameState,
    );
    emit(newScreenState);
  }

  void onEmailUnfocused() {
    final previousScreenState = state;
    final previousEmailState = previousScreenState.email;
    final previousEmailValue = previousEmailState.value;

    final newEmailState = Email.validated(
      previousEmailValue,
    );
    final newScreenState = previousScreenState.copyWith(
      email: newEmailState,
    );
    emit(newScreenState);
  }

  void onPasswordUnfocused() {
    final previousScreenState = state;
    final previousPasswordState = previousScreenState.password;
    final previousPasswordValue = previousPasswordState.value;

    final newPasswordState = Password.validated(
      previousPasswordValue,
    );
    final newScreenState = previousScreenState.copyWith(
      password: newPasswordState,
    );
    emit(newScreenState);
  }

  void onPasswordConfirmationUnfocused() {
    final previousScreenState = state;
    final previousPasswordConfirmationState =
        previousScreenState.passwordConfirmation;
    final previousPasswordConfirmationValue =
        previousPasswordConfirmationState.value;

    final newPasswordState = PasswordConfirmation.validated(
      previousPasswordConfirmationValue,
      password: state.password,
    );
    final newScreenState = previousScreenState.copyWith(
      passwordConfirmation: newPasswordState,
    );
    emit(newScreenState);
  }

  void incrementSalary() {
    final newSalary = Salary.dirty(state.salary.value + 10);
    emit(state.copyWith(salary: newSalary));
  }

  void decrementSalary() {
    final newSalary =
        Salary.dirty(state.salary.value == 0 ? 0 : state.salary.value - 10);
    emit(state.copyWith(salary: newSalary));
  }

  // New method to handle interests change
  void onInterestsChanged(List<String> values) {
    final newInterestsState = MultiSelectionCheckbox.dirty(values);
    emit(state.copyWith(interests: newInterestsState));
  }

  // New method to handle gender change
  void onGenderChanged(String? value) {
    final newGenderState = Gender.dirty(value ?? '');
    emit(state.copyWith(gender: newGenderState));
  }

  void onSubmit(BuildContext context) async {
    final firstname = Username.validated(state.firstname.value);
    final lastname = Username.validated(state.lastname.value);
    final email = Email.validated(state.email.value);
    final password = Password.validated(state.password.value);
    final userType = Dropdown.validated(state.userType.value);
    final passwordConfirmation = PasswordConfirmation.validated(
        state.passwordConfirmation.value,
        password: state.password);

    final isFormValid = Formz.validate([
      firstname,
      lastname,
      email,
      password,
      passwordConfirmation,
      userType
    ]).isValid;

    final newState = state.copyWith(
      firstname: firstname,
      lastname: lastname,
      email: email,
      userType: userType,
      password: password,
      passwordConfirmation: passwordConfirmation,
      submissionStatus: isFormValid
          ? SubmissionStatus.inProgress
          : SubmissionStatus.genericError,
    );

    emit(newState);

    if (isFormValid) {
      //delay for 1 seconds
      emit(newState.copyWith(
          go2nd: true, submissionStatus: SubmissionStatus.idle));
      log("🟢🟢🟢 Register button clicked 🟢🟢🟢");
    }
  }

  Future<void> onSubmit2nd(BuildContext context,
      StringTagController<String> stringTagController, File? file) async {
    final about = About.validated(state.about.value);
    final interests = MultiSelectionCheckbox.dirty(state.interests.value);
    final birthDate = Date.validated(state.birthDate.value);
    final salary = Salary.dirty(state.salary.value);
    final gender = Gender.dirty(state.gender.value);

    if (stringTagController.getTags?.length == 0) {
      stringTagController.setError = "skills cant be empty";
    }

    final isFormValid = Formz.validate([
      gender,
      about,
      birthDate,
      salary,
      interests,
    ]).isValid;

    final newState = state.copyWith(
      about: about,
      gender: gender,
      birthDate: birthDate,
      salary: salary,
      interests: interests,
      submissionStatus: isFormValid
          ? SubmissionStatus.isBtnLoading
          : SubmissionStatus.genericError,
    );

    emit(newState);
    if (!isFormValid || stringTagController.getTags?.length == 0) {
      emit(state.copyWith(submissionStatus: SubmissionStatus.genericError));
    } else {
      try {
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        final String formatted = formatter.format(state.birthDate.value!);

        // Example usage of registerUser
        final response = await apiClient.registerUser(
          firstName: state.firstname.value,
          lastName: state.lastname.value,
          about: state.about.value,
          tags: _getTags(stringTagController),
          favoriteSocialMedia: state.interests.value,
          salary: state.salary.value.toString(),
          password: state.password.value,
          email: state.email.value,
          birthDate: formatted,
          gender: _getGender(state.gender.value),
          type: state.userType.value!.value.toString(),
          passwordConfirmation: state.passwordConfirmation.value,
          avatar: file,
        );
        if (response.response.statusCode == 200) {
          emit(state.copyWith(submissionStatus: SubmissionStatus.success));
          context.go(loginRoutePath);
          context.showSuccessSnackBar("Account created successfully");
        }
      } on DioException catch (e) {
        if (e.response?.statusCode == 422) {
          final error = e.response.toString();
          RegExp regExp = RegExp(r'\["(.*?)\"]');
          Match? match = regExp.firstMatch(error);

          if (match != null) {
            String extractedData = match.group(1) ?? '';
            context.showErrorSnackBar(extractedData);
          }
        } else {
          context.showErrorSnackBar(e.handleDioError());
        }
        emit(state.copyWith(submissionStatus: SubmissionStatus.genericError));
      } catch (e) {
        context.showErrorSnackBar(e.toString());
        emit(state.copyWith(submissionStatus: SubmissionStatus.genericError));
      }
    }
  }

  String? _getGender(String g) {
    if (g == "") {
      return null;
    } else if (g == "Male") {
      return "0";
    } else {
      return "1";
    }
  }

  List<String> _getTags(StringTagController<String> stringTagController) {
    final List<String> list = [];
    for (var element in state.dependenciesResponse!.data.tags) {
        if (stringTagController.getTags!.any(
          (e) => element.label == e,
        )) {
          list.add(element.value.toString());
        }
      }
    return list;
  }
}
