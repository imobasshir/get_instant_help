import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_instant_help/firebase_options.dart';
import 'package:get_instant_help/pages/home_page.dart';
import 'package:get_instant_help/pages/login_screen.dart';
import 'package:get_instant_help/pages/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Instant Help',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const SignupScreen(),
        "/home": (context) => const HomeScreen(),
        "/login": (context) => const LoginScreen(),
      },
    );
  }
}
