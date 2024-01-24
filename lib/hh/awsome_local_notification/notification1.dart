// import 'dart:async';
//
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
//
// import 'notification_service.dart';
//
// class NotificationAwesome extends StatefulWidget {
//   const NotificationAwesome({Key? key}) : super(key: key);
//
//   @override
//   State<NotificationAwesome> createState() => _NotificationAwesomeState();
// }
//
// class _NotificationAwesomeState extends State<NotificationAwesome> {
//   @override
//   void initState() {
//     AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
//       if (!isAllowed) {
//         AwesomeNotifications().requestPermissionToSendNotifications();
//       }
//     });
//
//     super.initState();
//   }
//
//   DateTime? weekda;
//   DateTime? selectedDate; // تاريخ المستخدم المحدد
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Column(
//               children: <Widget>[
//             //     Padding(
//             //       padding: EdgeInsets.all(8),
//             //       child: ElevatedButton(
//             //         child: const Text('playAlarm'),
//             //         onPressed: () {
//             //           FlutterRingtonePlayer.playAlarm();
//             //         },
//             //       ),
//             //     ),
//             //     Padding(
//             //       padding: EdgeInsets.all(8),
//             //       child: ElevatedButton(
//             //         child: const Text('playAlarm asAlarm: false'),
//             //         onPressed: () {
//             //           FlutterRingtonePlayer.playAlarm(asAlarm: false);
//             //         },
//             //       ),
//             //     ),
//             //     Padding(
//             //       padding: EdgeInsets.all(8),
//             //       child: ElevatedButton(
//             //         child: const Text('playNotification'),
//             //         onPressed: () {
//             //           FlutterRingtonePlayer.playNotification(looping: true);
//             //         },
//             //       ),
//             //     ),
//             //     Padding(
//             //       padding: EdgeInsets.all(8),
//             //       child: ElevatedButton(
//             //         child: const Text('playRingtone'),
//             //         onPressed: () {
//             //           FlutterRingtonePlayer.playRingtone();
//             //         },
//             //       ),
//             //     ),
//             //     // Padding(
//             //     //   padding: EdgeInsets.all(8),
//             //     //   child: ElevatedButton(
//             //     //     child: const Text('Play from asset (iphone.mp3)'),
//             //     //     onPressed: () {
//             //     //       FlutterRingtonePlayer.play(
//             //     //           fromAsset: "assets/audio/iphone.mp3");
//             //     //     },
//             //     //   ),
//             //     // ),
//             //     Padding(
//             //       padding: EdgeInsets.all(8),
//             //       child: ElevatedButton(
//             //         child: const Text('Play from asset (android.wav)'),
//             //         onPressed: () {
//             //           FlutterRingtonePlayer.play(
//             //               fromAsset: "assets/audio/android.wav", looping: true);
//             //         },
//             //       ),
//             //     ),
//             //     Padding(
//             //       padding: EdgeInsets.all(8),
//             //       child: ElevatedButton(
//             //         child: const Text('play'),
//             //         onPressed: () {
//             //           FlutterRingtonePlayer.play(
//             //             android: AndroidSounds.ringtone,
//             //             ios: IosSounds.glass,
//             //             looping: true,
//             //             volume: 1,
//             //           );
//             //         },
//             //       ),
//             //     ),
//             //     Padding(
//             //       padding: EdgeInsets.all(8),
//             //       child: ElevatedButton(
//             //         child: const Text('stop'),
//             //         onPressed: () {
//             //           FlutterRingtonePlayer.stop();
//             //         },
//             //       ),
//             //     ),
//             //   ],
//             // ),
//             // Padding(
//             //   padding: const EdgeInsets.all(20.0),
//             //   child: TextButton(
//             //     child: Text(
//             //       'Normal',
//             //       style: TextStyle(fontSize: 20),
//             //     ),
//             //     onPressed: () async {
//             //       await NotificationService.showNotification(
//             //         title: 'Normal',
//             //         body: 'NORMAL',
//             //       );
//             //     },
//             //   ),
//             // ),
//             // Padding(
//             //   padding: const EdgeInsets.all(20.0),
//             //   child: TextButton(
//             //     child: Text(
//             //       'Inbox',
//             //       style: TextStyle(fontSize: 20),
//             //     ),
//             //     onPressed: () async {
//             //       await NotificationService.showNotification(
//             //           title: 'Inbox',
//             //           body: 'Inbox',
//             //           notificationLayout: NotificationLayout.Inbox);
//             //     },
//             //   ),
//             // ),
//             // Padding(
//             //   padding: const EdgeInsets.all(20.0),
//             //   child: MaterialButton(
//             //     child: Text(
//             //       'ProgressBar',
//             //       style: TextStyle(fontSize: 20),
//             //     ),
//             //     onPressed: () async {
//             //       await NotificationService.showNotification(
//             //         title: 'ProgressBar',
//             //         body: 'ProgressBar',
//             //         summary: 'ProgressBar',
//             //         notificationLayout: NotificationLayout.ProgressBar,
//             //       );
//             //     },
//             //   ),
//             // ),
//             // YourForm(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class YourForm extends StatefulWidget {
//   @override
//   _YourFormState createState() => _YourFormState();
// }
//
// class _YourFormState extends State<YourForm> {
//   DateTime? selectedDatssse;
//   TimeOfDay? selectedTimezzzz;
//   int notificationId = 1;
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2100),
//     );
//
//     if (pickedDate != null && pickedDate != selectedDatssse) {
//       setState(() {
//         selectedDatssse = pickedDate;
//       });
//     }
//   }
//
//   Future<void> _selectTime(BuildContext context) async {
//     final TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//
//     if (pickedTime != null && pickedTime != selectedTimezzzz) {
//       setState(() {
//         selectedTimezzzz = pickedTime;
//       });
//     }
//   }
//
//   // void scheduleNotification() async {
//   //   // if (selectedDatssse == null || selectedTimezzzz == null) {
//   //   //   // يجب أن يتم تحديد التاريخ والوقت قبل جدولة الإشعار
//   //   //   return;
//   //   // }
//   //
//   //   await AwesomeNotifications().createNotification(
//   //     content: NotificationContent(
//   //       id: notificationId,
//   //       channelKey: 'channelKey',
//   //       title: 'صلى على محمد',
//   //       body: 'اللهم صلى وسلم وبارك على محمد',
//   //       bigPicture:
//   //           'https://modo3.com/thumbs/fit630x300/7185/1633590580/%D8%A7%D8%AC%D9%85%D9%84_%D8%B5%D9%84%D8%A7%D8%A9_%D8%B9%D9%84%D9%89_%D8%A7%D9%84%D9%86%D8%A8%D9%8A.jpg',
//   //       notificationLayout: NotificationLayout.BigPicture,
//   //     ),
//   //     schedule: NotificationCalendar(
//   //       year: selectedDatssse!.year,
//   //       month: selectedDatssse!.month,
//   //       day: selectedDatssse!.day,
//   //       hour: selectedTimezzzz!.hour,
//   //       minute: selectedTimezzzz!.minute,
//   //       repeats: true,
//   //       allowWhileIdle: true,
//   //     ),
//   //   );
//   //   FlutterRingtonePlayer.playAlarm(asAlarm: false);
//   //
//   //   // // تشغيل الصوت
//   //   // FlutterRingtonePlayer.play(
//   //   //   fromAsset: 'assets/audio/android.wav',
//   //   //   looping: true,
//   //   //   volume: 1.0,
//   //   // );
//   //
//   //   // استماع إلى حدث تجاهل الإشعار
//   //   // استماع إلى حدث إنشاء الإشعارات
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.all(8),
//           child: ElevatedButton(
//             child: const Text('اختر التاريخ'),
//             onPressed: () => _selectDate(context),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(8),
//           child: ElevatedButton(
//             child: const Text('اختر الوقت'),
//             onPressed: () => _selectTime(context),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: TextButton(
//             child: Text(
//               'BigPicture',
//               style: TextStyle(fontSize: 20),
//             ),
//             onPressed: () async {
//               String localTimeZone =
//                   await AwesomeNotifications().getLocalTimeZoneIdentifier();
//
//               //test
//               // Navigator.of(context).push(MaterialPageRoute(
//               //     builder: (context) => QiblahCompass()));
//               await NotificationService.showNotification(
//                 title: 'صلى على محمد',
//                 body: 'اللهم صلى وسلم وبارك على محمد',
//                 category: NotificationCategory.Reminder,
//                 notificationLayout: NotificationLayout.BigPicture,
//                 // scheduled: NotificationCalendar(
//                 //     second: 2, timeZone: localTimeZone, repeats: true),
//                 scheduled: NotificationCalendar(
//                   year: selectedDatssse!.year,
//                   month: selectedDatssse!.month,
//                   day: selectedDatssse!.day,
//                   hour: selectedTimezzzz!.hour,
//                   minute: selectedTimezzzz!.minute,
//                   second: DateTime.now().second + 2,
//                   millisecond: 0,
//                   repeats: true,
//                   preciseAlarm: true,
//                 ),
//
//                 bigPicture:
//                     'https://modo3.com/thumbs/fit630x300/7185/1633590580/%D8%A7%D8%AC%D9%85%D9%84_%D8%B5%D9%84%D8%A7%D8%A9_%D8%B9%D9%84%D9%89_%D8%A7%D9%84%D9%86%D8%A8%D9%8A.jpg',
//               );
//             },
//           ),
//         ),
//         // Padding(
//         //   padding: EdgeInsets.all(8),
//         //   child: ElevatedButton(
//         //     child: const Text('جدولة الإشعار'),
//         //     onPressed: () => scheduleNotification(),
//         //   ),
//         // ),
//       ],
//     );
//   }
// }
