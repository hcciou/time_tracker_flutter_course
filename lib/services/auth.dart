import 'package:firebase_auth/firebase_auth.dart';

class User {
  User({this.uid});
  String uid;
}

abstract class AuthBase {
  Future<User> checkCurrentUser();
  Future<User> signInAnonymously();
  Future<void> signOut();
}

class Auth implements AuthBase {
  final FirebaseAuth auth = FirebaseAuth.instance;

  User _uidFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(uid: user.uid);
  }

  @override
  Future<User> checkCurrentUser() async {
    FirebaseUser user = await auth.currentUser();
    return _uidFromFirebase(user);
  }

  @override
  Future<User> signInAnonymously() async {
    AuthResult result = await auth.signInAnonymously();
    return _uidFromFirebase(result.user);
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }
}
