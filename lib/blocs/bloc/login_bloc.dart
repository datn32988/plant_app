import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  LoginBloc() : super(LoginInitial()) {
    on<LoginbuttonActionCall>((event, emit) async {
      emit(LoginLoading());
      try {
        final UserCredential userCredential =
            await firebaseAuth.signInWithEmailAndPassword(
          email: event.loginEmail,
          password: event.loginPassword,
        );
        if (userCredential.user != null) {
          emit(LoginSuccess(userCredential: userCredential));
        } else {
          emit(LoginError(loginError: "Invalid User"));
        }
      } catch (e) {
        emit(LoginError(loginError: "loginError ${e.toString()}"));
        throw Exception(e.toString());
      }
    });
  }
}
