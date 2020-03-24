import 'package:firebase_auth/firebase_auth.dart';

class User {
  User({this.uid});
  String uid;
}

abstract class AuthBase {
  Future<User> checkCurrentUser();
  Future<User> signInAnonymously();
  Future<void> signOut();
  Stream<User> get authStateChange;
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
    await _auth.signOut();
  }
}
