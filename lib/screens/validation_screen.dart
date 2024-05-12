import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/screens/formuler_screen.dart';
import 'package:myapp/widgets/my_button.dart';

class ValidationScreen extends StatefulWidget {
  static const String ScreenRoute = 'validation_screen';
  const ValidationScreen({super.key});

  @override
  State<ValidationScreen> createState() => _ValidationScreenState();
}

class _ValidationScreenState extends State<ValidationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 180,
                child: Image.asset('images/aalogo.png'),
              ),
              const Center(
                child: Text(
                  "la lettre de réclamation est confirmé ",
                  style: TextStyle(
                      color: Color.fromARGB(165, 0, 0, 0), fontSize: 17),
                ),
              ),
              const SizedBox(height: 30),
              MyButton(
                color: Colors.blue[900]!,
                title: 'donner un autre lettre de réclamation',
                onPressed: () {
                  Navigator.pushNamed(context, FormulerScreen.ScreenRoute);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
