import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get_instant_help/services/auth_methods.dart';
import 'package:get_instant_help/widgets/custom_buttons.dart';
import 'package:get_instant_help/widgets/custom_password_field.dart';
import 'package:get_instant_help/widgets/custom_text_field.dart';

class DoctorLoginSignUp extends StatefulWidget {
  const DoctorLoginSignUp({super.key});

  @override
  State<DoctorLoginSignUp> createState() => _DoctorLoginSignUpState();
}

class _DoctorLoginSignUpState extends State<DoctorLoginSignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signUpUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).signUpDoctor(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Doctor Sign Up",
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
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomPassField(
              controller: passwordController,
              hintText: 'Enter your password',
            ),
          ),
          const SizedBox(height: 40),
          CustomButton(
            onTap: signUpUser,
            text: 'Sign Up',
          ),
          const SizedBox(height: 4),
          const Divider(),
          const SizedBox(height: 4),
          SignInButton(
            Buttons.Google,
            text: "Sign up with Google",
            onPressed: () {
              FirebaseAuthMethods(FirebaseAuth.instance)
                  .doctorGoogle(context);
            },
            elevation: 1.0,
          ),
        ],
      ),
    );
  }
}