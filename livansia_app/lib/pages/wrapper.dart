import 'package:flutter/material.dart';
import 'package:livansia_app/helpers/imports.dart';
import 'package:livansia_app/pages/login_screen.dart';
import 'package:livansia_app/pages/welcome_screens/welcome_register.dart';
import 'package:livansia_app/pages/welcome_screens/welcome_screen.dart';
import 'package:livansia_app/services/authedication_service.dart';

import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  final bool apoPou;
  const Wrapper({super.key, required this.apoPou});

  // final PushNotificationsService _pushNotificationService =
  //     PushNotificationsService();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthService>(context);

//     _pushNotificationService.initialise();
// //
    if (userProvider.userInstance == null) {
      return AuthScreen();
    } else {
      //return WelcomeScreen();
      switch (apoPou) {
        case true:
          return WelcomeScreen();

        case false:
          return WelcomeRegister();
      }
    }
    return Container();
  }
}
