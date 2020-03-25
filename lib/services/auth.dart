import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class User {
  User({this.uid});
  String uid;
}

abstract class AuthBase {
  Future<User> checkCurrentUser();
  Future<User> signInAnonymously();
  Future<User> signInWithGoogle();
  Future<User> signInWithFacebook();
  Stream<User> get authStateChange;
  Future<void> signOut();
}

class Auth implements AuthBase {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(uid: user.uid);
  }

  @override
  Future<User> signInWithFacebook() async {
    // Facebook SignIn Step1
    final FacebookLogin facebookLogin = FacebookLogin();
    // Facebook SignIn Step2
    facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    print('FB 1');
    final result = await facebookLogin.logInWithReadPermissions(
      ['email'],
    );

    print('FB 2');

    if (result.accessToken != null) {
      // Facebook SignIn Step3
      print('FB 3');

      final AuthResult authResult = await _auth.signInWithCredential(
        FacebookAuthProvider.getCredential(
            accessToken: result.accessToken.token),
      );
      // Facebook SignIn Step4
      print('FB 4');
      return _userFromFirebase(authResult.user);
    } else {
      throw PlatformException(
          code: 'ERROR_MISSING_FACEBOOK_AUTH_TOKEN',
          message: 'missing facebook auth token.');
    }
  }

  @override
  Future<User> signInWithGoogle() async {
    // Google SignIn Step1
    final GoogleSignIn googleSignIn = GoogleSignIn();
    // Google SignIn Step2
    final GoogleSignInAccount googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      // Google SignIn Step3
      final GoogleSignInAuthentication googleAuth =
          await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        // Google SignIn Step4
        final AuthResult result = await _auth.signInWithCredential(
          GoogleAuthProvider.getCredential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );
        // Google SignIn Step5
        return _userFromFirebase(result.user);
      } else {
        throw PlatformException(
            code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
            message: 'missing google auth token.');
      }
    } else {
      throw PlatformException(
          code: 'ERROR_ABORTED_BY_USER', message: 'error aborted by user.');
    }
  }

  @override
  Stream<User> get authStateChange => _auth.onAuthStateChanged
      .map(_userFromFirebase); // mas 裡面要寫一個函數作轉換，如這裡做 FirebaseUser -> User

  @override
  Future<User> checkCurrentUser() async {
    FirebaseUser user = await _auth.currentUser();
    return _userFromFirebase(user);
  }

  @override
  Future<User> signInAnonymously() async {
    AuthResult result = await _auth.signInAnonymously();
    return _userFromFirebase(result.user);
  }

  @override
  Future<void> signOut() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.signOut();
    FacebookLogin facebookLogin = FacebookLogin();
    facebookLogin.logOut();
    await _auth.signOut();
  }
}
