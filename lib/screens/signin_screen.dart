import 'package:flutter/material.dart';
import 'package:myapp/screens/formuler_screen.dart';
import 'package:myapp/widgets/my_button.dart';

final _formkey = GlobalKey<FormState>();

class SignInScreen extends StatefulWidget {
  static const String ScreenRoute = 'signin_screen';

  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _idController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _idController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const String id1 = '''àà&éàé"àé(''';
    const String id2 = '''àà&é_ç--(ç''';
    const String id3 = '''àà&"-é-éçà''';
    const String id4 = '''àà&&è_"à'(''';

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 180,
                child: Image.asset('images/logo.jpg'),
              ),

              //ID *******************************
              const SizedBox(height: 50),
              TextFormField(
                controller: _idController,
                textAlign: TextAlign.center,
                onChanged: (value) {},
                validator: (id) =>
                    id != id1 && id != id2 && id != id3 && id != id4
                        ? "Id n'exist pas"
                        : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  hintText: 'Enter your ID',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),

              //Password ************************
              //SizedBox(height: 8),
              //TextField(
              //  obscureText: true,
              //  textAlign: TextAlign.center,
              //  onChanged: (value) {
              //    password = value;
              //  },
              //  decoration: const InputDecoration(
              //    hintText: 'Enter your password',
              //    contentPadding: EdgeInsets.symmetric(
              //      vertical: 10,
              //      horizontal: 20,
              //    ),
              //    border: OutlineInputBorder(
              //      borderRadius: BorderRadius.all(
              //        Radius.circular(10),
              //      ),
              //    ),
              //    enabledBorder: OutlineInputBorder(
              //      borderSide: BorderSide(
              //        color: Colors.blue,
              //        width: 1,
              //      ),
              //      borderRadius: BorderRadius.all(
              //        Radius.circular(10),
              //      ),
              //    ),
              //    focusedBorder: OutlineInputBorder(
              //      borderSide: BorderSide(
              //        color: Colors.blue,
              //        width: 2,
              //      ),
              //      borderRadius: BorderRadius.all(
              //        Radius.circular(10),
              //      ),
              //    ),
              //  ),
              //),

              const SizedBox(height: 30),
              MyButton(
                color: Colors.blue[900]!,
                title: 'Sign in',
                onPressed: () {
                  if (_formkey.currentState!.validate() == true) {
                    Navigator.pushNamed(context, FormulerScreen.ScreenRoute);
                  } else {}
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
