import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../form_fields.dart';

class Username extends FormzInput<String, UsernameValidationError>
    with EquatableMixin {
  const Username.unvalidated([
    String value = '',
  ]) : super.pure(value);

  const Username.validated(
    String value,
  ) : super.dirty(value);

  static final _usernameRegex = RegExp(
    r'^(?=.{3,50}$)[a-zA-Z]+(?:-[a-zA-Z]+)*(?: [a-zA-Z]+(?:-[a-zA-Z]+)*)*$',
  );

  @override
  UsernameValidationError? validator(String value) {
    if (value.isEmpty) {
      return UsernameValidationError.empty;
    } else if (!_usernameRegex.hasMatch(value)) {
      return UsernameValidationError.invalid;
    } else {
      return null;
    }
  }

  @override
  List<Object?> get props => [
        value,
        pure,
      ];
}

enum UsernameValidationError {
  empty,
  invalid,
}

String? userNameErrMsg(
    UsernameValidationError? usernameValidationError, BuildContext context) {
  switch (usernameValidationError) {
    case UsernameValidationError.empty:
      return "Name cannot be empty";
    case UsernameValidationError.invalid:
      return "Names must be between 3 and 50 characters long letters";
    default:
      return null;
  }
}
