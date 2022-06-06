import 'package:flutter/material.dart';
import 'package:livansia_app/global/loading.dart';
import 'package:livansia_app/helpers/imports.dart';
import 'package:livansia_app/pages/first_page.dart';
import 'package:livansia_app/pages/welcome_screens/welcome_register.dart';
import 'package:livansia_app/pages/welcome_screens/welcome_screen.dart';
import 'package:livansia_app/services/authedication_service.dart';

import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  final bool apoPou;

  Wrapper({Key? key, required this.apoPou}) : super(key: key);

  // final PushNotificationsService _pushNotificationService =
  //     PushNotificationsService();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthService>(context, listen: false);

    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SnackBar(content: Text('Error'));
          } else if (snapshot.hasData) {
            //return WelcomeScreen();
            switch (apoPou) {
              case true:
                return WelcomeScreen();

              case false:
                return WelcomeRegister();

              default:
                return WelcomeScreen();
            }
          } else {
            return FirstScreen();
          }
        });
    // if (userProvider.userInstance == null) {
    //   return AuthScreen();
    // } else {
    //   //return WelcomeScreen();
    //   switch (apoPou) {
    //     case true:
    //       return WelcomeScreen();

    //     case false:
    //       return WelcomeRegister();
    //   }
  }
}
