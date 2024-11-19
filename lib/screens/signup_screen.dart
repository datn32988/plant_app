import 'package:flutter/material.dart';
import 'package:plant_app/blocs/SignUpbloc/sign_up_bloc.dart';
import 'package:plant_app/blocs/SignUpbloc/sign_up_state.dart';
import 'package:plant_app/screens/home_screen.dart';
import 'package:plant_app/widget/app_input_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SigupScreenState();
}

class _SigupScreenState extends State<SignupScreen> {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const HomeScreen();
          }));
        }
        if (state is SignUpError) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Login Error ${state.signUpError}')));
        }
      },
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          if (state is SignUpLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return signUpForm();
        },
      ),
    ));
  }

  Widget signUpForm() {
    return Form(
      key: globalKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'SingUp',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          appInputField(
            hinText: 'User Name',
            preFixIcon: Icons.person,
            textEditingController: userController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please type you User Name";
              }
              return null;
            },
          ),
          appInputField(
            hinText: 'Email',
            preFixIcon: Icons.email,
            textEditingController: emailTextController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please type you Email address";
              }
              return null;
            },
          ),
          appInputField(
            hinText: 'Password',
            preFixIcon: Icons.password,
            textEditingController: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please type you password";
              }
              return null;
            },
          ),
          appInputField(
            hinText: 'Confirm Password',
            preFixIcon: Icons.password,
            textEditingController: confirmpasswordController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please type you confirm password";
              }
              return null;
            },
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  if (globalKey.currentState!.validate()) {
                    context.read<SignUpBloc>().add(
                          SignUpButtonActionCall(
                            signUpEmail: emailTextController.text,
                            signUpPassword: passwordController.text,
                            signUpUserName: userController.text,
                          ),
                        );
                  }
                },
                child: const Text('SignUp'),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('already have an account'))
        ],
      ),
    );
  }
}
