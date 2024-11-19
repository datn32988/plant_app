import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/blocs/bloc/login_bloc.dart';
import 'package:plant_app/screens/home_screen.dart';
import 'package:plant_app/screens/signup_screen.dart';
import 'package:plant_app/widget/app_input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Center(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const HomeScreen();
              }));
            }
            if (state is LoginError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.loginError)));
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return loginForm();
              }
            },
          ),
        ),
      )),
    );
  }

  Widget loginForm() {
    return Form(
      key: globalKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Welcome Back",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          appInputField(
            hinText: 'Email',
            preFixIcon: Icons.email,
            textEditingController: emailTextController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please type you email address";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 12,
          ),
          appInputField(
            hinText: 'PassWord',
            preFixIcon: Icons.password,
            textEditingController: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please type you password";
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
                      context.read<LoginBloc>().add(
                            LoginbuttonActionCall(
                                loginEmail: emailTextController.text,
                                loginPassword: passwordController.text),
                          );
                    }
                  },
                  child: const Text('Login')),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {}, child: const Text("Forget Password")),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const SignupScreen();
                    }));
                  },
                  child: const Text("SignUp")),
            ],
          ),
        ],
      ),
    );
  }
}
