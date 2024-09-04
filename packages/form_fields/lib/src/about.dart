import 'package:equatable/equatable.dart';

import '../form_fields.dart';

class About extends FormzInput<String, AboutValidationError>
    with EquatableMixin {
  const About.unvalidated([
    String value = '',
  ]) : super.pure(value);

  const About.validated(
    String value,
  ) : super.dirty(value);

  @override
  AboutValidationError? validator(String value) {
    if (value.isEmpty) {
      return AboutValidationError.empty;
    } else if (value.length < 10) {
      return AboutValidationError.tooShort;
    } else if (value.length > 1000) {
      return AboutValidationError.tooLong;
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

enum AboutValidationError {
  empty,
  tooShort,
  tooLong,
}

String? aboutErrMsg(AboutValidationError? aboutValidationError) {
  switch (aboutValidationError) {
    case AboutValidationError.empty:
      return 'The about field cannot be empty.';
    case AboutValidationError.tooShort:
      return 'The about field must be at least 10 characters long.';
    case AboutValidationError.tooLong:
      return 'The about field must be less than 200 characters long.';
    default:
      return null;
  }
}
