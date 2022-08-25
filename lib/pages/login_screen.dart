import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get_instant_help/routes.dart';
import 'package:get_instant_help/services/auth_methods.dart';
import 'package:get_instant_help/widgets/custom_buttons.dart';
import 'package:get_instant_help/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUsers() async {
    FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Login",
            style: TextStyle(
              fontSize: 30,
              color: Colors.lightBlue,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: emailController,
              hintText: 'Enter your email',
              ans: false,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: passwordController,
              hintText: 'Enter your password',
              ans: true,
            ),
          ),
          const SizedBox(height: 40),
          CustomButton(
            onTap: loginUsers,
            text: 'Login',
          ),
          const SizedBox(height: 40),
          CustomButton(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.signup);
            },
            text: 'Sign Up',
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 8),
          SignInButton(
            Buttons.Google,
            text: "Login with Google",
            onPressed: () {
              FirebaseAuthMethods(FirebaseAuth.instance)
                  .signInWithGoogle(context);
            },
            elevation: 1.0,
          ),
          const SizedBox(height: 8),
          CustomButton(
            onTap: () {
              context.read<FirebaseAuthMethods>().signInAnonymously(context);
            },
            text: 'Anonymous Login',
          ),
        ],
      ),
    );
  }
}
