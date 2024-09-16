import 'package:livansia_app/helpers/imports.dart';
import 'package:livansia_app/pages/first_page.dart';
import 'package:livansia_app/pages/welcome_screens/welcome_register.dart';
import 'package:livansia_app/pages/welcome_screens/welcome_screen.dart';
import 'package:livansia_app/services/push_notification_service.dart';

class Wrapper extends StatelessWidget {
  final bool apoPou;
  // ignore: unused_field
  final PushNotificationsService _pushNotificationService =
      PushNotificationsService();
  Wrapper({Key? key, required this.apoPou}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SnackBar(content: Text('Error'));
          } else if (snapshot.hasData) {
            //return WelcomeScreen();
            switch (apoPou) {
              case true:
                return const WelcomeScreen();

              case false:
                return const WelcomeRegister();

              default:
                return const WelcomeScreen();
            }
          } else {
            return const FirstScreen();
          }
        });
  }
}
