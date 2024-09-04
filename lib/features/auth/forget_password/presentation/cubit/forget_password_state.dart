import 'package:equatable/equatable.dart';
import 'package:form_fields/form_fields.dart';

enum ForgetPasswordStatus { initial, loading, success, error }

class ForgetPasswordState extends Equatable {
  const ForgetPasswordState({
    this.phone = const Phone.unvalidated(),
    this.submissionStatus = SubmissionStatus.idle,
    this.forgetPasswordStatus = ForgetPasswordStatus.initial,
    this.message = '',
  });

  final Phone phone;
  final SubmissionStatus submissionStatus;
  final ForgetPasswordStatus forgetPasswordStatus;
  final String message;
  ForgetPasswordState copyWith({
    Phone? phone,
    Password? password,
    SubmissionStatus? submissionStatus,
    ForgetPasswordStatus? forgetPasswordStatus,
    String? message,
  }) {
    return ForgetPasswordState(
      phone: phone ?? this.phone,
      submissionStatus: submissionStatus ?? this.submissionStatus,
      forgetPasswordStatus: forgetPasswordStatus ?? this.forgetPasswordStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props =>
      [phone, submissionStatus, forgetPasswordStatus, message];
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
