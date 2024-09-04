import 'package:equatable/equatable.dart';

import '../form_fields.dart';

class Skills extends FormzInput<String, SkillsValidationError>
    with EquatableMixin {
  const Skills.unvalidated([
    String value = '',
  ]) : super.pure(value);

  const Skills.validated(
    String value,
  ) : super.dirty(value);

  @override
  SkillsValidationError? validator(String value) {
    if (value.isEmpty) {
      return SkillsValidationError.empty;
    } else {
      List<String> skills =
          value.split(',').map((skill) => skill.trim()).toList();
      if (skills.length < 2) {
        return SkillsValidationError.tooFew;
      } else if (skills.length > 5) {
        return SkillsValidationError.tooMany;
      }
    }
    return null;
  }

  @override
  List<Object?> get props => [
        value,
        pure,
      ];
}

enum SkillsValidationError {
  empty,
  tooFew,
  tooMany,
}

String? skillsErrMsg(SkillsValidationError? skillsValidationError) {
  switch (skillsValidationError) {
    case SkillsValidationError.empty:
      return 'The skills field cannot be empty.';
    case SkillsValidationError.tooFew:
      return 'You must enter at least 2 skills.';
    case SkillsValidationError.tooMany:
      return 'You can enter a maximum of 5 skills.';
    default:
      return null;
  }
}
