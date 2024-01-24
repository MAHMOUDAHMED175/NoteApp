// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
//
// import '../screens/main.dart';
// import '../screens/settings_tab.dart';
//
// class NotificationService {
//   static Future initializeNotification() async {
//     await AwesomeNotifications().setListeners(
//         onActionReceivedMethod: onActionReceivedMethod,
//         onNotificationCreatedMethod: onNotificationCreatedMethod,
//         onNotificationDisplayedMethod: onNotificationDisplayedMethod,
//         onDismissActionReceivedMethod: onDismissActionReceivedMethod);
//
//     await AwesomeNotifications().initialize(
//       null,
//       [
//         NotificationChannel(
//           channelGroupKey: 'channelKey',
//           channelKey: 'channelKey',
//           channelName: 'channelKey',
//           channelDescription: 'channelDescription',
//           playSound: true,
//           criticalAlerts: true,
//           onlyAlertOnce: true,
//           channelShowBadge: true,
//           importance: NotificationImportance.Max,
//           ledColor: Colors.orange,
//           defaultColor: Colors.grey[200],
//         )
//       ],
//       debug: true,
//       channelGroups: [
//         NotificationChannelGroup(
//             channelGroupKey: 'channelKey', channelGroupName: 'channelKey')
//       ],
//     );
//   }
//
//   /// Use this method to detect when a new notification or a schedule is created
//   @pragma("vm:entry-point")
//   static Future<void> onNotificationCreatedMethod(
//       ReceivedNotification receivedNotification) async {
//     // Your code goes here
//   }
//
//   /// Use this method to detect every time that a new notification is displayed
//   @pragma("vm:entry-point")
//   static Future<void> onNotificationDisplayedMethod(
//       ReceivedNotification receivedNotification) async {
//     // Your code goes here
//   }
//
//   /// Use this method to detect if the user dismissed a notification
//   @pragma("vm:entry-point")
//   static Future<void> onDismissActionReceivedMethod(
//       ReceivedAction receivedAction) async {
//     // Your code goes here
//   }
//
//   /// Use this method to detect when the user taps on a notification or action button
//   @pragma("vm:entry-point")
//   static Future<void> onActionReceivedMethod(
//       ReceivedAction receivedAction) async {
//     if (receivedAction.buttonKeyPressed == 'check') {
//       String? page = receivedAction.payload?['page'];
//       if (page == '/my_page') {
//         MyApp.navigatorKey.currentState!.push(
//           MaterialPageRoute(
//             builder: (_) => SettingsTab(),
//           ),
//         );
//       }
//     }
//   }
//
//   static Future showNotification({
//     required final String title,
//     required final String body,
//     final String? summary,
//     final Map<String, String>? payload,
//     final ActionType actionType = ActionType.Default,
//     final NotificationLayout notificationLayout = NotificationLayout.Default,
//     final NotificationCategory? category,
//     final String? bigPicture,
//     final List<NotificationActionButton>? actionButton,
//     final NotificationSchedule? scheduled,
//     final int? interval,
//     required final int idDiffrient,
//   }) async {
//     await AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: idDiffrient,
//           channelKey: 'channelKey',
//           title: title,
//           category: category,
//           body: body,
//           actionType: actionType,
//           notificationLayout: notificationLayout,
//           summary: summary,
//           payload: payload,
//           bigPicture: bigPicture,
//           customSound: 'assets/sounds/sou.mp3',
//         ),
//         actionButtons: actionButton,
//         schedule: scheduled);
//     // await AwesomeNotifications().cancelAllSchedules();
//   }
// }
