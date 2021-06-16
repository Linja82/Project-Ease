import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future signInWithGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();

      // if user doesn't select an account, return
      if (googleUser == null)
        throw FirebaseAuthException(
            message: "Sign in aborted by user", code: "ERROR_ABORTED_BY_USER");

      // if user selects an account, save user inside _user
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      // Get credentials
      final userCredential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

      // Sign in to FirebaseAuth
      await FirebaseAuth.instance.signInWithCredential(userCredential);
    } catch (e) {
      print(e.toString());
    }

    notifyListeners(); // To update UI

  }

  Future signOut() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }

}