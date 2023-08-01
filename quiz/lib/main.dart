import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:quizzapp/firebase_options.dart';
import 'package:quizzapp/routes.dart';
import 'package:quizzapp/services/firestore.dart';
import 'package:quizzapp/services/models.dart';
import 'package:quizzapp/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      create: (_) => FirestoreService().streamReport(),
      initialData: Report(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: appRoutes,
        theme: appTheme,
      ),
    );
  }
}
