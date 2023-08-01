import 'package:quizzapp/about/about.dart';
import 'package:quizzapp/profile/profile.dart';
import 'package:quizzapp/login/login.dart';
import 'package:quizzapp/topics/topics.dart';
import 'package:quizzapp/home/home.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/topics': (context) => const TopicsScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/about': (context) => const AboutScreen(),
};
