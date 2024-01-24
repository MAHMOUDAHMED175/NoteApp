// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:todo/hh/repeate/resource.dart';
// import 'package:uuid/uuid.dart';
// import 'package:workmanager/workmanager.dart';
//
// import 'MainScreen.dart';
//
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
//
// Future showNotification() async {
//   int rndmIndex = Random().nextInt(StaticVars().smallDo3a2.length - 1);
//
//   AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails(
//     'rndmIndex',
//     'تطبيق المسلم',
//     importance: Importance.max,
//     priority: Priority.high,
//     playSound: true,
//     enableVibration: true,
//   );
//
//   var platformChannelSpecifics = NotificationDetails(
//     android: androidPlatformChannelSpecifics,
//   );
//
//   await flutterLocalNotificationsPlugin.show(
//     Uuid().v4().codeUnitAt(0),
//     'فَذَكِّرْ',
//     StaticVars().smallDo3a2[rndmIndex],
//     platformChannelSpecifics,
//   );
//
//   /// periodically...but const id && const title,body
//   /*await flutterLocalNotificationsPlugin.periodicallyShow(
//     Random().nextInt(azkar.length-1),
//     'السلام عليكم',
//     azkar[Random().nextInt(azkar.length-1)],
//     RepeatInterval.everyMinute,
//     platformChannelSpecifics,
//     androidAllowWhileIdle: true,
//     payload: '',
//   );*/
// }
//
// void callbackDispatcher() {
//   // initial notifications
//   var initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');
//   // var initializationSettingsIOS = IOSInitializationSettings();
//
//   var initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//     // iOS: initializationSettingsIOS,
//   );
//
//   flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   WidgetsFlutterBinding.ensureInitialized();
//
//   flutterLocalNotificationsPlugin.initialize(
//     initializationSettings,
//   );
//
//   Workmanager().executeTask((task, inputData) {
//     showNotification();
//     return Future.value(true);
//   });
// }
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     Future.delayed(Duration(seconds: 2), () {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (_) => MainScreen()));
//     });
//
//     Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           'Splash',
//           style: TextStyle(fontSize: 70),
//         ),
//       ),
//     );
//   }
// }
