import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

enum DropdownValidationError { empty }

class Dropdown extends FormzInput<DropDownValueModel?, DropdownValidationError>
    with EquatableMixin {
  const Dropdown.unvalidated([DropDownValueModel? value]) : super.pure(null);
  const Dropdown.validated([DropDownValueModel? value]) : super.dirty(value);

  @override
  DropdownValidationError? validator(DropDownValueModel? value) {
    return value != null ? null : DropdownValidationError.empty;
  }

  @override
  List<Object?> get props => [value];
}

String? dropdownErrorText(DropdownValidationError? error) {
  switch (error) {
    case DropdownValidationError.empty:
      return 'This field cannot be empty';
    default:
      return null;
  }
}
