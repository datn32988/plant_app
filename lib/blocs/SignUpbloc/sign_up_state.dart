import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpState extends Equatable {
  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpError extends SignUpState {
  final String signUpError;

  SignUpError({required this.signUpError});

  @override
  // TODO: implement props
  List<Object> get props => [signUpError];
}

final class SignUpSuccess extends SignUpState {
  final UserCredential userCredential;

  SignUpSuccess({required this.userCredential});

  @override
  // TODO: implement props
  List<Object> get props => [userCredential];
}
