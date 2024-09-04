import 'package:api_client/api_client.dart';
import 'package:equatable/equatable.dart';
import 'package:form_fields/form_fields.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.dependenciesResponse,
    this.salary = const Salary.pure(), // New field
    this.go2nd = false,
    this.birthDate = const Date.unvalidated(), // New field
    this.firstname = const Username.unvalidated(),
    this.lastname = const Username.unvalidated(),
    this.email = const Email.unvalidated(),
    this.password = const Password.unvalidated(),
    this.passwordConfirmation = const PasswordConfirmation.unvalidated(),
    this.userType = const Dropdown.unvalidated(), // Change to unvalidated
    this.about = const About.unvalidated(),
    this.interests = const MultiSelectionCheckbox.pure(), // Add interests field

    this.gender = const Gender.pure(), // Add gender field
// New field
    this.skills = const Skills.unvalidated(), // New field
    this.submissionStatus = SubmissionStatus.idle,
    this.message = '',
  });
  final Gender gender; // Add gender field
  final MultiSelectionCheckbox interests; // Add interests field
  final Salary salary; // New field
  final bool go2nd;
  final Date birthDate; // New field
  final Username firstname;
  final Username lastname;
  final Email email;
  final Password password;
  final PasswordConfirmation passwordConfirmation;
  final Dropdown userType; // UserType is now of type Dropdown
  final About about; // New field
  final Skills skills; // New field
  final SubmissionStatus submissionStatus;
  final String message;
  final DependenciesResponse? dependenciesResponse;

  RegisterState copyWith({
    DependenciesResponse? dependenciesResponse,
    Gender? gender, // Add gender field
    MultiSelectionCheckbox? interests, // Add interests field
    bool? go2nd,
    Salary? salary, // New field
    Username? firstname,
    Username? lastname,
    Email? email,
    Password? password,
    PasswordConfirmation? passwordConfirmation,
    Dropdown? userType,
    Date? birthDate, // New field
    About? about, // New field
    Skills? skills, // New field
    SubmissionStatus? submissionStatus,
    String? message,
  }) {
    return RegisterState(
      dependenciesResponse: dependenciesResponse ?? this.dependenciesResponse,
      gender: gender ?? this.gender, // Add gender field
      interests: interests ?? this.interests, // Add interests field
      salary: salary ?? this.salary, // New field
      birthDate: birthDate ?? this.birthDate, // New field
      go2nd: go2nd ?? this.go2nd,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      userType: userType ?? this.userType,
      about: about ?? this.about, // New field
      skills: skills ?? this.skills, // New field
      submissionStatus: submissionStatus ?? this.submissionStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        dependenciesResponse,
        go2nd,
        interests, // Add interests field
        gender, // Add gender field
        salary,
        birthDate, // New field
        firstname,
        lastname,
        email,
        password,
        passwordConfirmation,
        userType,
        about, // New field
        skills, // New field
        submissionStatus,
        message,
      ];
}

enum SubmissionStatus {
  idle,
  inProgress,
  isBtnLoading,
  success,
  genericError,
  invalidCredentialsError,
}
