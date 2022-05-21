import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../global/functions/database_firebase.dart';
import '../helpers/imports.dart';

class AuthService with ChangeNotifier {
  Timer? _timer;
  final FirebaseAuth? _auth = FirebaseAuth.instance;
  User? userInstance;

  Users? _userFromFirebaseUser(User user) {
    return Users(uid: user.uid);
  }

  //auth change user stream
  Stream<User?> get user {
    _initializeTimer();
    return FirebaseAuth.instance.authStateChanges();
  }

  //sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth!
          .signInWithEmailAndPassword(email: email, password: password);

      userInstance = result.user;
      return _userFromFirebaseUser(userInstance!);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return e.toString();
    }
  }

  Future<void> resetPassword(String email) async {
    await _auth?.sendPasswordResetEmail(email: email);
  }

//final lista = new List<int>(6);
  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential? result = await _auth?.createUserWithEmailAndPassword(
          email: email, password: password);
      userInstance = result!.user;

      //creates a new document for the user with uid
      await DatabaseService(uid: userInstance!.uid).setUserData([], [], '', '');
      // await DatabaseService(uid: user.uid).setUserEvents(null);

      return _userFromFirebaseUser(userInstance!);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return e.toString();
    }
  }

  //sign out
  Future signOut() async {
    try {
      //_timer.cancel();

      return await _auth!.signOut();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  //timer for sign_out
  void _initializeTimer() {
    _timer = Timer.periodic(const Duration(days: 2), (_) => _auth!.signOut());
  }
}

// if (date != null &&
//         date == date.add(Duration(minutes: 2/*hours: 1*/)) &&
//         user != null) {
//       return  User(uid: user.uid);
