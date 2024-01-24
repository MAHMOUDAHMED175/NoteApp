// import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';
// import 'package:workmanager/workmanager.dart';
//
// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   @override
//   void initState() {
//     Workmanager().registerPeriodicTask(
//       "${Uuid().v4()}",
//       "periodic Notification",
//       frequency: Duration(seconds: 5),
//     );
//
//     Workmanager().registerPeriodicTask(
//       "${Uuid().v4()}",
//       "periodic Notification at day",
//       frequency: Duration(minutes: 2),
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           'Main Screen',
//           style: TextStyle(fontSize: 70),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }
