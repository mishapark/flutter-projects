import 'package:flash/constants.dart';
import 'package:flash/rounded_button.dart';
import 'package:flash/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login';

  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                decoration:
                    inputDecoration.copyWith(hintText: "Enter your email"),
                onChanged: (value) {
                  email = value;
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                style: const TextStyle(color: Colors.blue),
                decoration:
                    inputDecoration.copyWith(hintText: "Enter your password"),
                onChanged: (value) {
                  password = value;
                },
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                text: 'Log In',
                color: Colors.lightBlueAccent,
                callback: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final existingUser = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    Navigator.pushNamed(context, ChatScreen.id);
                  } catch (e) {
                    print(e);
                  } finally {
                    setState(() {
                      showSpinner = false;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
