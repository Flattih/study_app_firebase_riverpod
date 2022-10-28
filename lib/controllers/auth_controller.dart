import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:study_app/extensions/logger.dart';
import 'package:study_app/firebase_ref/references.dart';
import 'package:study_app/screens/introduction/introduction_screen.dart';
import 'package:study_app/screens/login/login_screen.dart';
import 'package:study_app/widgets/dialogs/dialogue_widget.dart';

class AuthController {
  final FirebaseAuth auth;

  User? _user;

  AuthController({required this.auth});

  void navigateToIntroduction(BuildContext context) async {
    final navigator = Navigator.of(context);
    await Future.delayed(const Duration(seconds: 2));
    auth.authStateChanges().listen((User? user) {
      _user = user;
    });
    navigator.pushNamedAndRemoveUntil(
        AppIntroductionScreen.routeName, (route) => false);
  }

  signInWithGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        final authAccount = await account.authentication;
        final credential = GoogleAuthProvider.credential(
            idToken: authAccount.idToken, accessToken: authAccount.accessToken);
        await auth.signInWithCredential(credential);
        await saveUser(account);
        Navigator.pop(context);
      }
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      AppLogger.e(e);
    }
  }

  Future<void> signOut(BuildContext context) async {
    AppLogger.d("Sign out");
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      AppLogger.e(e);
    }
  }

  bool isLoggedIn() {
    return auth.currentUser != null;
  }

  void navigateToLoginPage(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  void showLoginAlertDialogue(BuildContext context) {
    Dialogs.questionStartDialogue(
        onTap: () {
          Navigator.pop(context);
          navigateToLoginPage(context);
        },
        context: context);
  }

  saveUser(GoogleSignInAccount account) {
    userRef.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilePic": account.photoUrl
    });
  }
}
