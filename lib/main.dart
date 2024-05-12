import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/screens/WelcommeScreen.dart';
import 'package:myapp/screens/formuler_screen.dart';
import 'package:myapp/screens/signin_screen.dart';
import 'package:myapp/screens/validation_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medis',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: WelcommeScreen.ScreenRoute,
      routes: {
        WelcommeScreen.ScreenRoute: (context) => const WelcommeScreen(),
        SignInScreen.ScreenRoute: (context) => const SignInScreen(),
        FormulerScreen.ScreenRoute: (context) => const FormulerScreen(),
        ValidationScreen.ScreenRoute: (context) => const ValidationScreen(),
      },
    );
  }
}

class RegistrationScreen {}
