part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {}

class LoginbuttonActionCall extends LoginEvent {
  final String loginEmail;
  final String loginPassword;

  LoginbuttonActionCall(
      {required this.loginEmail, required this.loginPassword});
  @override
  // TODO: implement props
  List<Object?> get props => [loginEmail, loginPassword];
}
