import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();
  static Future<void> onTapNotification(NotificationResponse response) async {
    String? payload = response.payload;
    onNotifications.add(payload);
  }

  static Future init({bool initScheduled = false}) async {
    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});
    var initializationSettingsAndroid =
        AndroidInitializationSettings('moon_icon');
    final settings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    tzdata.initializeTimeZones();

    final locationName = tz.local.name;
    tz.setLocalLocation(tz.getLocation(locationName));

    ///لما ييجى اشعار والابليكيشن مقفول ويدوس عليه يروح لصفحه معينه///////////////
    // final details =
    //     await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    // if (details != null && details.didNotificationLaunchApp) {
    //   String? payloadd = details.notificationResponse?.payload!;
    //   onNotifications.add(payloadd);
    // }

    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveBackgroundNotificationResponse: onTapNotification,
      onDidReceiveNotificationResponse: onTapNotification,
    );
    if (initScheduled) {
      tzdata.initializeTimeZones();
      final locationName = tz.local.name;
      tz.setLocalLocation(tz.getLocation(locationName));
    }
    // if (initScheduled) {
    //   tz.initializeTimeZones();
    //   final locationName = await FlutterNativeTimezone.getLocalTimezone();
    //   tz.setLocalLocation(tz.getLocation(locationName));
    // }
  }

  static Future showNotification({
    required final String title,
    required final String body,
    final String? icon,
    final String? summary,
    final String? payload,
    final String? bigPicture,
    required DateTime scheduled,
    final int? interval,
    required final int idDiffrient,
  }) async {
    var bigPictureConvert = await Utils.downloadFile(
        "https://w7.pngwing.com/pngs/499/460/png-transparent-quran-sahih-muslim-dua-allah-salah-pray-for-allah-angle-text-prayer-thumbnail.png",
        "bigPicture");
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channelKey',
      'channelName',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      color: Colors.amber,
      icon: icon,
      channelShowBadge: true,
      showProgress: true,
      largeIcon: DrawableResourceAndroidBitmap("moon_icon"),
      sound: RawResourceAndroidNotificationSound('sou'),
      styleInformation: BigPictureStyleInformation(
        FilePathAndroidBitmap(bigPictureConvert),
        //from assets
        // DrawableResourceAndroidBitmap("moon_icon"),
        // contentTitle: 'Summary',
        // summaryText: summary,
      ),
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      idDiffrient,
      title,
      body,
      // scheduledDaily(Time(8)),
      // scheduleWeekly(
      //     const
      //     //دا الوقت اللى هييجى فيه الاشعار الساعه 17 فى الايام اللى تحت دى
      //     TimeOfDay(hour: 13, minute: 58),
      //     days: [
      //       //الايام اللى هتيجى فيها الاشعار
      //       DateTime.tuesday,
      //       DateTime.friday,
      //       DateTime.wednesday,
      //       DateTime.sunday,
      //       DateTime.monday,
      //       DateTime.thursday,
      //       DateTime.saturday,
      //     ]),
      tz.TZDateTime.from(scheduled, tz.local),
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      // payload: payload!,
      // matchDateTimeComponents: DateTimeComponents.time,
      // matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static Future show({
    required final String title,
    required final String body,
    final String? summary,
    required final int idDiffrient,
  }) async {
    var bigPictureConvert = await Utils.downloadFile(
        "https://w7.pngwing.com/pngs/499/460/png-transparent-quran-sahih-muslim-dua-allah-salah-pray-for-allah-angle-text-prayer-thumbnail.png",
        "bigPicture");
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'ss',
      'aa',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      color: Colors.amber,
      channelShowBadge: true,
      showProgress: true,
      sound: RawResourceAndroidNotificationSound('sou'),
      styleInformation: BigPictureStyleInformation(
        FilePathAndroidBitmap(bigPictureConvert),
        //from assets
        // DrawableResourceAndroidBitmap("moon_icon"),
        // contentTitle: 'Summary',
        // summaryText: summary,
      ),
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      idDiffrient,
      title,
      body,
      platformChannelSpecifics,
      // scheduledDaily(Time(8)),
      // scheduleWeekly(
      //     const
      //     //دا الوقت اللى هييجى فيه الاشعار الساعه 17 فى الايام اللى تحت دى
      //     TimeOfDay(hour: 13, minute: 58),
      //     days: [
      //       //الايام اللى هتيجى فيها الاشعار
      //       DateTime.tuesday,
      //       DateTime.friday,
      //       DateTime.wednesday,
      //       DateTime.sunday,
      //       DateTime.monday,
      //       DateTime.thursday,
      //       DateTime.saturday,
      //     ]),
      // matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static Future showNotificationperioid({
    required final String title,
    required final String body,
    final String? icon,
    final String? payload,
    required final RepeatInterval repeatInterval,
    required final int idDiffrient,
  }) async {
    var bigPictureConvert = await Utils.downloadFile(
        "https://w7.pngwing.com/pngs/499/460/png-transparent-quran-sahih-muslim-dua-allah-salah-pray-for-allah-angle-text-prayer-thumbnail.png",
        "bigPicture");
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channekjhkjhlKey',
      'chanwwnelName',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      color: Colors.amber,
      icon: icon,
      channelShowBadge: true,
      showProgress: true,
      largeIcon: DrawableResourceAndroidBitmap("moon_icon"),
      sound: RawResourceAndroidNotificationSound('sou'),
      styleInformation: BigPictureStyleInformation(
        FilePathAndroidBitmap(bigPictureConvert),
        //from assets
        // DrawableResourceAndroidBitmap("moon_icon"),
        // contentTitle: 'Summary',
        // summaryText: summary,
      ),
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.periodicallyShow(
      idDiffrient,
      title,
      body,
      repeatInterval,
      platformChannelSpecifics,
      // scheduledDaily(Time(8)),
      // scheduleWeekly(
      //     const
      //     //دا الوقت اللى هييجى فيه الاشعار الساعه 17 فى الايام اللى تحت دى
      //     TimeOfDay(hour: 13, minute: 58),
      //     days: [
      //       //الايام اللى هتيجى فيها الاشعار
      //       DateTime.tuesday,
      //       DateTime.friday,
      //       DateTime.wednesday,
      //       DateTime.sunday,
      //       DateTime.monday,
      //       DateTime.thursday,
      //       DateTime.saturday,
      //     ]),
      // payload: payload!,
      // matchDateTimeComponents: DateTimeComponents.time,
    );
  }

// static tz.TZDateTime scheduledDaily(TimeOfDay time) {
//   final now = tz.TZDateTime.now(tz.local);
//   final scheduledDate = tz.TZDateTime(
//     tz.local,
//     now.year,
//     now.month,
//     now.day,
//     time.hour,
//     time.minute,
//   );
//
//   return scheduledDate.isBefore(now)
//       ? scheduledDate.add(const Duration(days: 1))
//       : scheduledDate;
// }
//
// static tz.TZDateTime scheduleWeekly(TimeOfDay time,
//     {required List<int> days}) {
//   tz.TZDateTime scheduledDate = scheduledDaily(time);
//
//   while (!days.contains(scheduledDate.weekday)) {
//     scheduledDate = scheduledDate.add(const Duration(days: 1));
//   }
//   return scheduledDate;
// }
}

class Utils {
  static Future<String> downloadFile(String url, String fileName) async {
    final directory = await getApplicationSupportDirectory();
    final filePath = "${directory.path}/$fileName";
    final response = await http.get(Uri.parse(url));
    final file = File(filePath);

    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }
}
