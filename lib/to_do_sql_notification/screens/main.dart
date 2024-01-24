// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:provider/provider.dart';
// import 'package:todo/hh/firebase_options.dart';
// import 'package:todo/hh/screens/register_screen.dart';
// import 'package:todo/hh/screens/settings_tab.dart';
// import 'package:uuid/uuid.dart';
//
// import '../firebase/firebase_functions.dart';
// import '../home_layout/home_layout.dart';
// import '../local notification/localno.dart';
// import '../provider/add_task_provider.dart';
// import '../provider/edit_task_provider.dart';
// import '../provider/home_provider.dart';
// import '../provider/init_user_provider.dart';
// import '../provider/themeProvider.dart';
// import '../style/my_theme.dart';
// import 'add_task_screen.dart';
// import 'login_screen.dart';
// //import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_messaging/firebase_messaging.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // ///receive message when app is in background
// // Future backgroundHandler(RemoteMessage message) async {
// //   await Firebase.initializeApp();
// // }
// // ///create channel
// // AndroidNotificationChannel channel = const AndroidNotificationChannel(
// //   'badrustuts', // id
// //   'High Importance Notifications', // title
// //   'This channel is used for important notifications.', // description
// //   importance: Importance.high,
// // );
// // /// initialize the [FlutterLocalNotificationsPlugin] package.
// // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// //     FlutterLocalNotificationsPlugin();
// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp();
// //   /// background messaging handler
// //   FirebaseMessaging.onBackgroundMessage(backgroundHandler);
// //   await flutterLocalNotificationsPlugin
// //       .resolvePlatformSpecificImplementation<
// //           AndroidFlutterLocalNotificationsPlugin>()
// //       ?.createNotificationChannel(channel);
// //   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
// //     alert: true,
// //     badge: true,
// //     sound: true,
// //   );
// //   runApp(MyApp());
// // }
// ///
//
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print(
//       'on backgrohhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhund');
//   NotificationService.showNotification(
//       title:
//           "{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{message.notification!.title.toString()}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}",
//       body:
//           "[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[message.notification!.body.toString()]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]",
//       scheduled: DateTime.now().add(Duration(seconds: 10)),
//       idDiffrient: Uuid().v4().codeUnitAt(0));
//   print(message.data.toString());
//   showToast(
//       text: 'اللهم صلى على الحبيب محمدا صلوات الله وسلامه عليه ',
//       state: ToastStates.WARNING);
// }
//
// void showToast({
//   required String text,
//   required ToastStates state,
// }) {
//   Fluttertoast.showToast(
//       msg: text,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 5,
//       backgroundColor: toastColor(state),
//       textColor: Colors.white,
//       fontSize: 15.0);
// }
//
// enum ToastStates { SUCCECC, ERROR, WARNING }
//
// Color toastColor(ToastStates state) {
//   Color color;
//   switch (state) {
//     case ToastStates.SUCCECC:
//       color = Colors.green;
//       break;
//     case ToastStates.ERROR:
//       color = Colors.red;
//       break;
//     case ToastStates.WARNING:
//       color = Colors.yellow;
//       break;
//   }
//   return color;
// }
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   NotificationService.init();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//
//   var token = await FirebaseMessaging.instance.getToken();
//   print(token);
//   print(token);
//   print(token);
//   print(token);
//   print(token);
// // ///
// // // هيبعت اشعار ولاكن مش هيظهر فى التطبيق هيظهر فى ال console
// // // دى والتطبيق مفتوح
//   FirebaseMessaging.onMessage.listen((event) {
//     print('on message');
//     print(event.data['id']);
//     print(event.data['name']);
//     print(event.data['value']);
//     print(event.data.toString());
//     print(event.notification!.title.toString());
//     print(event.notification!.body.toString());
//     // showToast(text: 'هتيجى والابليكيشن مفتوح', state: ToastStates.SUCCECC);
//
//     NotificationService.show(
//         title: event.notification!.title.toString(),
//         body: event.notification!.body.toString(),
//         idDiffrient: Uuid().v4().codeUnitAt(0));
//     showToast(
//         text:
//             'هتيجى والابليكيشن مفتوح${event.data.toString()} ${event.notification!.body.toString()}',
//         state: ToastStates.SUCCECC);
//   });
// //   ///
// //
// //
// //
//   ///
//   //  دى هيبعت اشعار
//   //  دى والتطبيق فى ال background يعنى   ه
//   //ولما تدوس على الاشعار يفتح التطبيق
//   //دى هتنفذ حاجه معينه لما التطبيق يفتح
//   //زى مثلا اظهر showtoast
//
//   FirebaseMessaging.onMessageOpenedApp.listen((event) {
//     print('background');
//
//     print(event.data.toString());
//     showToast(
//         text: 'صلى jkjjjjjjjjjjjjjjjjjjjjjjjjjjjjjعلى محمد',
//         state: ToastStates.ERROR);
//     //لما ادوس على الاشعار نفسه هيعرض اشعار
//   });
// // ///
//
//   // دى والتطبيق مفتوح فى الخلفيه or terminated completeley clesed app
//   // دى هنفذ حاجه معينه والتطبيق فى الخلفيه زى مثلا اظهر  showtoast  على الشاشه الرئيسيه
//   FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
//
//   ///
//
//   //Firebase FireStore.instance.disableNetwork();
//
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => ThemeProvider()),
//         ChangeNotifierProvider(create: (context) => FireBaseFunctions()),
//         ChangeNotifierProvider(create: (context) => InitUserProvider()),
//         ChangeNotifierProvider<HomeProvider>(
//           create: (context) {
//             // Create and initialize the HomeProvider with the steps data.
//             HomeProvider homeProvider = HomeProvider();
//             List<Step> steps = [];
//             homeProvider.steps = steps;
//             homeProvider.maxStepValue = steps.length - 1;
//             return homeProvider;
//           },
//         ),
//         ChangeNotifierProvider<AddTaskProvider>(
//           create: (context) {
//             AddTaskProvider addTaskProvider = AddTaskProvider();
//             var now = DateTime.now();
//             addTaskProvider.endTime =
//                 TimeOfDay(hour: now.hour, minute: now.minute);
//             addTaskProvider.startTime =
//                 TimeOfDay(hour: now.hour, minute: now.minute);
//
//             return AddTaskProvider();
//           },
//         ),
//         ChangeNotifierProvider(create: (context) => EditTaskProvider()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     var themeProvider = Provider.of<ThemeProvider>(context);
//     var initUserProvider = Provider.of<InitUserProvider>(context);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: initUserProvider.firebaseUser != null
//           ? HomeScreen.routeName
//           : LoginScreen.routeName,
//       routes: {
//         SettingsTab.routeName: (context) => SettingsTab(),
//         LoginScreen.routeName: (context) => LoginScreen(
//               payload: 'd',
//             ),
//         RegisterScreen.routeName: (context) => const RegisterScreen(),
//         HomeScreen.routeName: (context) => const HomeScreen(),
//         AddTaskScreen.routeName: (context) => AddTaskScreen(),
//       },
//       theme: MyThemeData.lightTheme,
//       darkTheme: MyThemeData.darkTheme,
//       themeMode: themeProvider.themeMode,
//     );
//   }
// }
