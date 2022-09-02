import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_instant_help/firebase_options.dart';
import 'package:get_instant_help/pages/home_page.dart';
import 'package:get_instant_help/pages/login_screen.dart';
import 'package:get_instant_help/pages/signup.dart';
import 'package:get_instant_help/services/auth_methods.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        title: 'Get Instant Help',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => const AuthWrapper(),
          "/signup": (context) => const SignupScreen(),
          "/home": (context) => const HomeScreen(),
          "/login": (context) => const LoginScreen(),
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userAcc = Provider.of<User?>(context);

    if (userAcc != null) {
      return const HomeScreen();
    }
    return const LoginScreen();
  }
}
