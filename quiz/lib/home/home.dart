import 'package:flutter/material.dart';
import 'package:quizzapp/login/login.dart';
import 'package:quizzapp/services/auth.dart';
import 'package:quizzapp/shared/error_message.dart';
import 'package:quizzapp/shared/loading.dart';
import 'package:quizzapp/topics/topics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return Center(
              child: ErrorMessage(
            message: snapshot.data.toString(),
          ));
        } else if (snapshot.hasData) {
          return const TopicsScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
