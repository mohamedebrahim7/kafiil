// multi_selection_checkbox.dart
import 'package:formz/formz.dart';

enum MultiSelectionValidationError { empty }

class MultiSelectionCheckbox
    extends FormzInput<List<String>, MultiSelectionValidationError> {
  const MultiSelectionCheckbox.pure() : super.pure(const []);
  const MultiSelectionCheckbox.dirty([List<String> value = const []])
      : super.dirty(value);

  @override
  MultiSelectionValidationError? validator(List<String> value) {
    return value.isNotEmpty ? null : MultiSelectionValidationError.empty;
  }
}

String? multiSelectionErrMsg(MultiSelectionValidationError? error) {
  switch (error) {
    case MultiSelectionValidationError.empty:
      return 'Please select at least one option';
    default:
      return null;
  }
}
