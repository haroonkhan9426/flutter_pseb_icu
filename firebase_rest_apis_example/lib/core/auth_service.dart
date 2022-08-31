import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  createAccount(final email, final password) async {
    try {
      final userCredentials = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (userCredentials.user != null) {
        return true;
      } else {
        Fluttertoast.showToast(msg: 'Account creation failed');
        return false;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: 'Email is already in Use');
      } else if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'Password is weak');
      }
    } catch (e) {
      print('Signup failed: $e.message');
    }
    return false;
  }

  login(final email, final password) async {
    try {
      final userCredentials = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredentials.user != null) {
        //successful login
        return true;
      } else {
        // login failed
        Fluttertoast.showToast(msg: 'Account creation failed');
        return false;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'User not found');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Wrong password');
      }
    } catch (e) {
      print('Signup failed: $e.message');
    }
    return false;
  }
}
