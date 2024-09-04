import 'package:formz/formz.dart';

enum BirthDateValidationError { empty, invalid }

class Date extends FormzInput<DateTime?, BirthDateValidationError> {
  const Date.unvalidated() : super.pure(null);

  const Date.validated([DateTime? value]) : super.dirty(value);

  @override
  BirthDateValidationError? validator(DateTime? value) {
    final now = DateTime.now();
    if (value == null) {
      return BirthDateValidationError.empty;
    } else if (value.isAfter(DateTime(now.year - 10, now.month, now.day))) {
      return BirthDateValidationError.invalid;
    } else {
      return null;
    }
  }
}

String? dateErrMsg(BirthDateValidationError? error) {
  switch (error) {
    case BirthDateValidationError.empty:
      return 'This field cannot be empty';
    case BirthDateValidationError.invalid:
      return 'Sorry, you must be at least 10 years old to proceed';
    default:
      return null;
  }
}
