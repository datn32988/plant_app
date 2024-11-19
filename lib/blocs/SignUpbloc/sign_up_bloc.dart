import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:plant_app/blocs/SignUpbloc/sign_up_state.dart';

part 'sign_up_event.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpButtonActionCall>((event, emit) async {
      emit(SignUpLoading());

      try {
        final UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
          email: event.signUpEmail,
          password: event.signUpPassword,
        );

        String? userToken = await FirebaseMessaging.instance.getToken();
        if (userCredential.user != null) {
          final userData = {
            "userName": event.signUpUserName,
            "userEmail": event.signUpEmail,
            "userToken": userToken,
          };

          await fireStore
              .collection("user")
              .doc(userCredential.user!.uid)
              .set(userData);

          emit(SignUpSuccess(userCredential: userCredential));
        } else {
          emit(SignUpError(signUpError: 'Invalid User Data'));
        }
      } catch (e) {
        emit(SignUpError(signUpError: e.toString()));
      }
    });
  }
}
