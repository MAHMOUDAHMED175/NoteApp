import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo/hh/firebase_options.dart';
import 'package:todo/hh/screens/register_screen.dart';
import 'package:todo/hh/screens/settings_tab.dart';
import 'package:uuid/uuid.dart';

import '../firebase/firebase_functions.dart';
import '../home_layout/home_layout.dart';
import '../local notification/localno.dart';
import '../provider/add_task_provider.dart';
import '../provider/edit_task_provider.dart';
import '../provider/home_provider.dart';
import '../provider/init_user_provider.dart';
import '../provider/themeProvider.dart';
import '../style/my_theme.dart';
import 'add_task_screen.dart';
import 'login_screen.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('on background');
  RepeatInterval chooseReturnToRepeatInterval(String time) {
    if (time == "everyMinute") {
      return RepeatInterval.everyMinute;
    } else if (time == "daily") {
      return RepeatInterval.daily;
    } else if (time == "hourly") {
      return RepeatInterval.hourly;
    } else {
      return RepeatInterval.weekly;
    }
  }

  if (message.data["reapatedAndSchedule"] == "RepeatInterval.everyMinute" ||
      message.data["reapatedAndSchedule"] == "RepeatInterval.hourly" ||
      message.data["reapatedAndSchedule"] == "RepeatInterval.daily") {
    await NotificationService.showNotificationperioid(
      idDiffrient: const Uuid().v4().codeUnitAt(0),
      title: message.notification!.title!,
      body: message.notification!.body!,
      icon: "moon_icon",
      repeatInterval:
          chooseReturnToRepeatInterval(message.data["reapatedAndSchedule"]),
    );
    print("period" +
        "${chooseReturnToRepeatInterval(message.data["reapatedAndSchedule"])}");
  } else {
    await NotificationService.showNotification(
      idDiffrient: const Uuid().v4().codeUnitAt(0),
      title: message.notification!.title!,
      body: message.notification!.body!,
      icon: "moon_icon",
      scheduled: DateTime(
        int.parse("${message.data["year"]}"),
        int.parse("${message.data["month"]}"),
        int.parse("${message.data["day"]}"),
        int.parse("${message.data["hour"]}"),
        int.parse("${message.data["minute"]}"),
        int.parse("${message.data["second"]}"),
      ),
    );
    print("scheduled");
  }
}

void showToast({
  required String text,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: toastColor(state),
      textColor: Colors.white,
      fontSize: 15.0);
}

enum ToastStates { SUCCECC, ERROR, WARNING }

Color toastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCECC:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.yellow;
      break;
  }
  return color;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService.init();

  var token = await FirebaseMessaging.instance.getToken();
  print(token);
// ///
// هيبعت اشعار ولاكن مش هيظهر فى التطبيق هيظهر فى ال console
// دى والتطبيق مفتوح
  RepeatInterval chooseReturnToRepeatInterval(String time) {
    if (time == "everyMinute") {
      return RepeatInterval.everyMinute;
    } else if (time == "daily") {
      return RepeatInterval.daily;
    } else if (time == "hourly") {
      return RepeatInterval.hourly;
    } else {
      return RepeatInterval.weekly;
    }
  }

  FirebaseMessaging.onMessage.listen((event) async {
    print('on message');
    // print(event.data['id']);
    // print(event.data['name']);
    // print(event.data['value']);
    // print(event.data.toString());
    // print(event.notification!.title.toString());
    // print(event.notification!.body.toString());
    // showToast(text: 'هتيجى والابليكيشن مفتوح', state: ToastStates.SUCCECC);

    if (event.data["reapatedAndSchedule"] == "RepeatInterval.everyMinute" ||
        event.data["reapatedAndSchedule"] == "RepeatInterval.hourly" ||
        event.data["reapatedAndSchedule"] == "RepeatInterval.daily") {
      await NotificationService.showNotificationperioid(
        idDiffrient: const Uuid().v4().codeUnitAt(0),
        title: event.notification!.title!,
        body: event.notification!.body!,
        icon: "moon_icon",
        repeatInterval:
            chooseReturnToRepeatInterval(event.data["reapatedAndSchedule"]),
      );
      print("period" +
          "${chooseReturnToRepeatInterval(event.data["reapatedAndSchedule"])}");
    } else {
      await NotificationService.showNotification(
        idDiffrient: const Uuid().v4().codeUnitAt(0),
        title: event.notification!.title!,
        body: event.notification!.body!,
        icon: "moon_icon",
        scheduled: DateTime(
          int.parse("${event.data["year"]}"),
          int.parse("${event.data["month"]}"),
          int.parse("${event.data["day"]}"),
          int.parse("${event.data["hour"]}"),
          int.parse("${event.data["minute"]}"),
          int.parse("${event.data["second"]}"),
        ),
      );
      print("scheduled");
    }
  });

  ///
//
//
//
  ///
  //  دى هيبعت اشعار
  //  دى والتطبيق فى ال background يعنى   ه
  //ولما تدوس على الاشعار يفتح التطبيق
  //دى هتنفذ حاجه معينه لما التطبيق يفتح
  //زى مثلا اظهر showtoast
  //
  // FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //   print('background');
  //
  //   print(event.data.toString());
  //   showToast(
  //       text: 'صلى jkjjjjjjjjjjjjjjjjjjjjjjjjjjjjjعلى محمد',
  //       state: ToastStates.ERROR);
  //   //لما ادوس على الاشعار نفسه هيعرض اشعار
  // });
// ///

  // دى والتطبيق مفتوح فى الخلفيه or terminated completeley clesed app
  // دى هنفذ حاجه معينه والتطبيق فى الخلفيه زى مثلا اظهر  showtoast  على الشاشه الرئيسيه
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  ///

  //Firebase FireStore.instance.disableNetwork();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => FireBaseFunctions()),
        ChangeNotifierProvider(create: (context) => InitUserProvider()),
        ChangeNotifierProvider<HomeProvider>(
          create: (context) {
            // Create and initialize the HomeProvider with the steps data.
            HomeProvider homeProvider = HomeProvider();
            List<Step> steps = [];
            homeProvider.steps = steps;
            homeProvider.maxStepValue = steps.length - 1;
            return homeProvider;
          },
        ),
        ChangeNotifierProvider<AddTaskProvider>(
          create: (context) {
            AddTaskProvider addTaskProvider = AddTaskProvider();
            var now = DateTime.now();
            addTaskProvider.endTime =
                TimeOfDay(hour: now.hour, minute: now.minute);
            addTaskProvider.startTime =
                TimeOfDay(hour: now.hour, minute: now.minute);

            return AddTaskProvider();
          },
        ),
        ChangeNotifierProvider(create: (context) => EditTaskProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var initUserProvider = Provider.of<InitUserProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initUserProvider.firebaseUser != null
          ? HomeScreen.routeName
          : LoginScreen.routeName,
      routes: {
        SettingsTab.routeName: (context) => SettingsTab(),
        LoginScreen.routeName: (context) => LoginScreen(
              payload: 'd',
            ),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        AddTaskScreen.routeName: (context) => AddTaskScreen(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: themeProvider.themeMode,
    );
  }
}
