import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_instant_help/firebase_options.dart';
import 'package:get_instant_help/pages/home/home.dart';
import 'package:get_instant_help/pages/login_screen.dart';
import 'package:get_instant_help/provider/destination_provider.dart';
import 'package:get_instant_help/services/auth_methods.dart';
import 'package:google_fonts/google_fonts.dart';
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
        ChangeNotifierProvider(
          create: (_) => DestinationProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Get Instant Help',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          backgroundColor: Colors.white,
          useMaterial3: true,
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuthMethods(FirebaseAuth.instance).authState,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return const Home();
            } else {
              return const LoginScreen();
            }
          },
        ),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userAcc = Provider.of<User?>(context);
    return userAcc != null ? const Home() : const LoginScreen();
  }
}
