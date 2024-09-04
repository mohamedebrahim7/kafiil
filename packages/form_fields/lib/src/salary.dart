import 'package:formz/formz.dart';

enum SalaryValidationError { invalid, tooLow, tooHigh }

class Salary extends FormzInput<double, SalaryValidationError> {
  const Salary.pure() : super.pure(100);
  const Salary.dirty([double value = 100]) : super.dirty(value);

  @override
  SalaryValidationError? validator(double value) {
    if (value < 100) {
      return SalaryValidationError.tooLow;
    } else if (value > 1000) {
      return SalaryValidationError.tooHigh;
    }
    return null;
  }
}

String? salaryErrMsg(SalaryValidationError? error) {
  switch (error) {
    case SalaryValidationError.tooLow:
      return 'Please select a salary greater than or equal to 100';
    case SalaryValidationError.tooHigh:
      return 'Salary cannot exceed 1000';
    default:
      return null;
  }
}
