import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class Email extends FormzInput<String, EmailValidationError>
    with EquatableMixin {
  const Email.unvalidated([String value = '']) : super.pure(value);

  const Email.validated(String value) : super.dirty(value);

  static final _emailRegex = RegExp(
    '^(([\\w-]+\\.)+[\\w-]+|([a-zA-Z]|[\\w-]{2,}))@((([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.'
    '([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.'
    '([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.'
    '([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9]))|([a-zA-Z]+[\\w-]+\\.)+[a-zA-Z]{2,4})\$',
  );

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) {
      return EmailValidationError.empty;
    } else if (value.length > 64) {
      return EmailValidationError.tooLong;
    } else if (!_emailRegex.hasMatch(value)) {
      return EmailValidationError.invalid;
    } else {
      return null;
    }
  }

  @override
  List<Object?> get props => [value, pure];
}

enum EmailValidationError {
  empty,
  invalid,
  tooLong,
}

String? emailErrMsg(EmailValidationError? error, BuildContext context) {
  switch (error) {
    case EmailValidationError.empty:
      return 'Email cannot be empty';
    case EmailValidationError.invalid:
      return 'Emails must follow the format \'example@example.com\'';
    case EmailValidationError.tooLong:
      return 'Email cannot exceed 64 characters';
    default:
      return null;
  }
}
