import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:livansia_app/global/show_snackBar.dart';
import 'package:livansia_app/pages/first_page.dart';
import 'package:livansia_app/providers/questions_provider.dart';

import '../global/functions/database_firebase.dart';
import '../helpers/imports.dart';

class AuthService with ChangeNotifier {
  Timer? _timer;
  FirebaseAuth? _auth;
  User? userInstance;
  Users?
      userApp; //its the user with the extra fields and take the uid,email,pass fron userFirebase
  User? userSignIn;

  Users? _userFromFirebaseUser(User user) {
    return Users(uid: user.uid);
  }

  void setUserSignIn() {
    if (FirebaseAuth.instance.currentUser != null) {
      userSignIn = FirebaseAuth.instance.currentUser!;
    } else {
      userSignIn = null;
    }
    //notifyListeners();
  }

  //auth change user stream
  Stream<User?> get user {
    _initializeTimer();
    return FirebaseAuth.instance.authStateChanges();
  }

  //sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      print('$email $password');
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // ignore: unnecessary_this
      this.userInstance = result.user;
      setUserSignIn();

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
  Future registerWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential? result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());
      userInstance = result.user;

      //creates a new document for the user with uid
      await DatabaseService(uid: userInstance!.uid).setUserDataNew(
        [],
        [],
        0,
        0,
        '',
        '',
      );

      await DatabaseService(uid: userInstance!.uid)
          .setUserEvents(DateTime(2000));
      // await DatabaseService(uid: user.uid).setUserEvents(null);

      return _userFromFirebaseUser(userInstance!);
    } on FirebaseException catch (e) {
      showSnackbar(context, e.toString());
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
      if (_auth == null) {
        return FirstScreen();
      }
      return await _auth!.signOut();
    } catch (e) {
      if (kDebugMode) {
        print(' signOut Error : ${e.toString()}');
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
