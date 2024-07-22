import 'package:firebase_auth/firebase_auth.dart';

class Authentiction {
  static final auth = FirebaseAuth.instance;

  static Future<String> CreateAcc(String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    return "yes";
  }

  static Future<void> Login(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> SignOut() async {
    await auth.signOut();
  }

  static Future<bool> loggedin() async {
    return auth.currentUser != null;
  }
}
