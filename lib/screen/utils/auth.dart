import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Auth {
  static Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  static Future<String?> signUp(String email, String password) async {
    FirebaseAuth fai = FirebaseAuth.instance;
    try {
      UserCredential uC = await fai.createUserWithEmailAndPassword(
          email: email, password: password);
      return uC.user!.email.toString();
    } on FirebaseAuthException catch (e) {
      return e.code.toString();
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String?> signIn(String email, String password) async {
    FirebaseAuth fai = FirebaseAuth.instance;
    try {
      UserCredential uC = await fai.signInWithEmailAndPassword(
          email: email, password: password);
      return uC.user!.email.toString();
    } on FirebaseAuthException catch (e) {
      return e.code.toString();
    } catch (e) {
      return e.toString();
    }
  }

  static Future<void> signOut({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut();
  }
}
