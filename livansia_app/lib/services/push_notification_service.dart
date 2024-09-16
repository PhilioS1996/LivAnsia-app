import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  late final FirebaseMessaging _fcm;

  Future initialise() async {
    // You may set the permission requests to "provisional" which allows the user to choose what type
// of notifications they would like to receive once the user receives a notification.
    final notificationSettings =
        await FirebaseMessaging.instance.requestPermission(provisional: true);

// For apple platforms, ensure the APNS token is available before making any FCM plugin API calls
    final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
    if (apnsToken != null) {
      // APNS token is available, make FCM plugin API requests...
    }

    // _fcm.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     print("onMessage: $message");
    //   },
    //   onLaunch: (Map<String, dynamic> message) async {
    //     print("onLaunch: $message");
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     print("onResume: $message");
    //   },
    // );
  }
}
