import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get_instant_help/routes.dart';
import 'package:get_instant_help/services/auth_methods.dart';
import 'package:get_instant_help/widgets/custom_buttons.dart';
import 'package:get_instant_help/widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signUpUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
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
            "Sign Up",
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
            onTap: signUpUser,
            text: 'Sign Up',
          ),
          const SizedBox(height: 40),
          CustomButton(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.login);
            },
            text: 'Log In',
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 8),
          SignInButton(
            Buttons.Google,
            text: "Sign up with Google",
            onPressed: () {
              FirebaseAuthMethods(FirebaseAuth.instance)
                  .signInWithGoogle(context);
            },
            elevation: 1.0,
          ),
        ],
      ),
    );
  }
}
