import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationServicesFirebase {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        sound: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('authorized');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('not authorized');
    } else {
      print('denied permission');
    }
  }

  Future<String?> getToken() async {
    String? token=await messaging.getToken();
    return token;
  }
}
