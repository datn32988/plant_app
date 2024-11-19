part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignUpButtonActionCall extends SignUpEvent {
  final String signUpEmail;
  final String signUpPassword;
  final String signUpUserName;

  SignUpButtonActionCall(
      {required this.signUpEmail,
      required this.signUpPassword,
      required this.signUpUserName});
  @override
  // TODO: implement props
  List<Object?> get props => [signUpEmail, signUpPassword, signUpUserName];
}
