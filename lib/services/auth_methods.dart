import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_instant_help/main.dart';
import 'package:get_instant_help/pages/home/home.dart';
import 'package:get_instant_help/widgets/snackbar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get_instant_help/models/user_model.dart' as model;
import 'package:get_instant_help/models/doctor_model.dart' as modeldoctor;

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuthMethods(
    this._auth,
  );
  User get user => _auth.currentUser!;

  Stream<User?> get authState => _auth.authStateChanges();
  User? get currentUser => _auth.currentUser!;

  // Email SignUp
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      model.User user = model.User(
        uid: credential.user!.uid,
        email: credential.user!.email!,
        type: 'user',
        name: '',
      );
      _firestore.collection('users').doc(credential.user!.uid).set(user.toJson());
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, 'Password is too weak');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, 'Email is already in use');
      } else {
        showSnackBar(context, e.message!);
      }
    }
  }

  // Email SignUp
  Future<void> signUpDoctor({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      modeldoctor.Doctor doctor = modeldoctor.Doctor(
        uid: credential.user!.uid,
        email: credential.user!.email!,
        type: 'doctor',
        name: '',
      );
      _firestore.collection('users').doc(credential.user!.uid).set(doctor.toJson());
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, 'Password is too weak');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, 'Email is already in use');
      } else {
        showSnackBar(context, e.message!);
      }
    }
  }

  // Email Login
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // UserCredential credential = 
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!user.emailVerified) {
        await sendEmailVerification(context);
        showSnackBar(context, 'Email verification sent');
      }
      // model.User us = model.User(
      //   uid: credential.user!.uid,
      //   email: credential.user!.email!,
      //   type: 'user',
      //   name: '',
      // );
      // _firestore.collection('users').doc(credential.user!.uid).set(us.toJson());
      // Navigator.pushNamed(context, MyRoutes.home);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const Home();
          },
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'User not found');
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'Wrong password');
      } else {
        showSnackBar(context, e.message!);
      }
    }
  }

  // Email Verification
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email Verification Sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  // SignOut
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AuthWrapper(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  // Google SignIn
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        model.User user = model.User(
          uid: userCredential.user!.uid,
          email: userCredential.user!.email!,
          type: 'user',
          name: userCredential.user!.displayName!,
        );

        _firestore.collection('users').doc(userCredential.user!.uid).set(
              user.toJson(),
            );
        // Navigator.pushNamed(context, MyRoutes.home);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const Home();
            },
          ),
        );
        // if you want to do specific task like storing information in firestore
        // only for new users using google sign in (since there are no two options
        // for google sign in and google sign up, only one as of now),
        // do the following:

        // if (userCredential.user != null) {
        //   if (userCredential.additionalUserInfo!.isNewUser) {}
        // }
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  // Google SignIn Doctor
  Future<void> doctorGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        modeldoctor.Doctor doctor = modeldoctor.Doctor(
          uid: userCredential.user!.uid,
          email: userCredential.user!.email!,
          type: 'doctor',
          name: userCredential.user!.displayName!,
        );

        _firestore.collection('users').doc(userCredential.user!.uid).set(
              doctor.toJson(),
            );
        // Navigator.pushNamed(context, MyRoutes.home);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const Home();
            },
          ),
        );
        // if you want to do specific task like storing information in firestore
        // only for new users using google sign in (since there are no two options
        // for google sign in and google sign up, only one as of now),
        // do the following:

        // if (userCredential.user != null) {
        //   if (userCredential.additionalUserInfo!.isNewUser) {}
        // }
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  // Anonimous Signin
  Future<void> signInAnonymously(BuildContext context) async {
    try {
      UserCredential credential = await _auth.signInAnonymously();
      model.User user = model.User(
        uid: credential.user!.uid,
        email: '',
        type: 'user',
        name: '',
      );
      _firestore.collection('users').doc(credential.user!.uid).set(user.toJson());
      // Navigator.pushNamed(context, MyRoutes.home);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const Home();
          },
        ),
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  // DELETE ACCOUNT
  Future<void> deleteAccount(BuildContext context) async {
    try {
      await _auth.currentUser!.delete();
      // Navigator.pushNamed(context, MyRoutes.auth);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const AuthWrapper();
          },
        ),
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
      // if an error of requires-recent-login is thrown, make sure to log
      // in user again and then delete account.
    }
  }
}
