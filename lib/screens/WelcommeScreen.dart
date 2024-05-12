import 'package:flutter/material.dart';
import 'package:myapp/screens/signin_screen.dart';
import 'package:myapp/widgets/my_button.dart';

class WelcommeScreen extends StatefulWidget {
  static const String ScreenRoute = 'WelcommeScreen';
  const WelcommeScreen({super.key});

  @override
  State<WelcommeScreen> createState() => _WelcommeScreenState();
}

class _WelcommeScreenState extends State<WelcommeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 180,
                  child: Image.asset('images/logo.jpg'),
                ),
                //const Text(
                //  'MessageMe',
                //  style: TextStyle(
                //    fontSize: 40,
                //    fontWeight: FontWeight.w
                const SizedBox(height: 100),
                MyButton(
                  color: Colors.blue[800]!,
                  title: 'Sign in',
                  onPressed: () {
                    Navigator.pushNamed(context, SignInScreen.ScreenRoute);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
