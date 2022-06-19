import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _auth.currentUser;
    } catch (e) {
      throw e.toString();
    }
    return user;
  }

  Future<User?> signUp({
    required String email,
    required String password,
    required bool isDriver,
  }) async {
    User? user;

    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    user = _auth.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set({"emailId": user.email, "isDriver": isDriver});
    }

    return user;
  }

  Stream<User?> get userStream {
    return _auth.authStateChanges();
  }

  User? get user {
    return _auth.currentUser;
  }

  Future signOut() async {
    await _auth.signOut();
  }
}
