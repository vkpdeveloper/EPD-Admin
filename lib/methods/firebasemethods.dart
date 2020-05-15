import 'package:firebase_auth/firebase_auth.dart';

class FirebaseMethods {
  Future<bool> isLoggedIn() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user != null;
  }
}
