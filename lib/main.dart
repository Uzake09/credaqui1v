import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled2/cores/routes/rotas.dart';
import 'package:untitled2/firebase_options.dart';
import 'package:untitled2/src/create_accont/create_accont.dart';
import 'package:untitled2/src/home/home.dart';
import 'package:untitled2/src/login/login.dart';
import 'package:untitled2/src/splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CredeAi',
      theme: ThemeData(),
      initialRoute: Routes.splashPage,
      routes: {
        Routes.splashPage: (context) => const SplashView(),
        Routes.loginPage: (context) => const LoginView(),
        Routes.createAccountPage: (context) => const CreateAccountView(),
        Routes.homePage: (context) => const HomePage(),
      },
    );
  }
}
