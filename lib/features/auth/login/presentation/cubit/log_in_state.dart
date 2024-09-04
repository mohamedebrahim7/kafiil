import 'package:equatable/equatable.dart';
import 'package:form_fields/form_fields.dart';

class LogInState extends Equatable {
  const LogInState({
    this.email = const Email.unvalidated(),
    this.password = const Password.unvalidated(),
    this.submissionStatus = SubmissionStatus.idle,
    this.message = '',
  });

  final Email? email;
  final Password? password;
  final SubmissionStatus submissionStatus;
  final String message;

  LogInState copyWith({
    Email? email,
    Password? password,
    SubmissionStatus? submissionStatus,
    String? message,
  }) {
    return LogInState(
      email: email ?? this.email,
      password: password ?? this.password,
      submissionStatus: submissionStatus ?? this.submissionStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        submissionStatus,
        message,
      ];
}

enum SubmissionStatus {
  /// Used when the form has not been sent yet.
  idle,

  /// Used to disable all buttons and add a progress indicator to the main one.
  inProgress,

  /// Used to close the screen and navigate back to the caller screen.
  success,

  /// Used to display a generic snack bar saying that an error has occurred, e.g., no internet connection.
  genericError,

  /// Used to show a more specific error telling the user they got the email and/or password wrong.
  invalidCredentialsError,
}
