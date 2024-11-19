import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/blocs/SignUpbloc/sign_up_bloc.dart';
import 'package:plant_app/blocs/bloc/login_bloc.dart';
import 'package:plant_app/blocs/bloc/main_screen_bloc.dart';
import 'package:plant_app/blocs/cart_bloc/bloc/cart_bloc.dart';
import 'package:plant_app/blocs/get_plant/bloc/get_plant_bloc.dart';
import 'package:plant_app/firebase_options.dart';
import 'package:plant_app/repository/firebase_plant_repo.dart';
import 'package:plant_app/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    String? token = await FirebaseMessaging.instance.getToken();
    print("Token $token");
    runApp(const MyApp());
  } catch (e) {
    print("$e" as num);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SignUpBloc()),
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => MainScreenBloc()),
        BlocProvider(create: (_) => CartBloc()),
        BlocProvider(
            create: (_) => GetPlantBloc(FirebasePlantRepo())..add(GetPlant())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
