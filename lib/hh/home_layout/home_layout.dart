import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../firebase/firebase_functions.dart';
import '../model/task_model.dart';
import '../provider/home_provider.dart';
import '../provider/init_user_provider.dart';
import '../provider/themeProvider.dart';
import '../reusable/widget/cu_container_shimmer.dart';
import '../reusable/widget/task_card.dart';
import '../screens/add_task_screen.dart';
import '../screens/login_screen.dart';
import 'fcm/notification_services_firebase.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // var serverKey =
  //     "AAAAyX8MaYs:APA91bFYHVsQW43jVJT-eZMMS8A9cyNa7Za9IWYuBu5MJa2W4bDbIL93PlPK8GKQl1HKmbgIefyVukvMJaHi4Vuof2mxDeuF5yYYKI9S4DTcJiWHS1LpSdVjSt8J_CslNrZPGGoBVvMG";
  //when app is terminated run this method
  initMessage() async {
    var message = await FirebaseMessaging.instance.getInitialMessage();

    if (message != null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginScreen(payload: "dddd")));
    }
  }

  @override
  void initState() {
    NotificationServicesFirebase().requestNotificationPermission();
    initMessage();
    super.initState();
    // listenNotification();
  }

  // listenNotification() =>
  //     NotificationService.onNotifications.stream.listen((payload) {
  //       Navigator.of(context).push(MaterialPageRoute(
  //           builder: (context) => LoginScreen(payload: payload!)));
  //     });
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var homeProvider = Provider.of<HomeProvider>(context);
    var initUser = Provider.of<InitUserProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      themeProvider.changeTheme(
                          themeProvider.themeMode == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light);
                    },
                    child: themeProvider.themeMode == ThemeMode.light
                        ? const ImageIcon(
                            AssetImage("assets/moon_icon.png"),
                            size: 20,
                          )
                        : const ImageIcon(
                            AssetImage(
                              "assets/sun_icon.png",
                            ),
                            size: 25,
                            color: Colors.white,
                          ),
                  ),
                  const Spacer(),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<MenuItem>(
                      // Specify the type for DropdownButton2
                      customButton: const Icon(
                        Icons.account_circle_outlined,
                        size: 35,
                      ),
                      items: [
                        DropdownMenuItem<MenuItem>(
                          value: MenuItems.logout,
                          child: MenuItems.buildItem(MenuItems.logout),
                        ),
                      ],
                      onChanged: (value) {
                        MenuItems.onChanged(context, value!, () {
                          Navigator.pushNamed(context, LoginScreen.routeName);
                          initUser.signOut();
                        });
                      },
                      dropdownStyleData: DropdownStyleData(
                        width: 140,
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(30),
                            topLeft: Radius.circular(25),
                          ),
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                        ),
                        offset: const Offset(0, 8),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.only(left: 20, right: 20),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat.yMMMMd().format(
                            DateTime.now(),
                          ),
                          style: GoogleFonts.quicksand(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Today",
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 55,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, AddTaskScreen.routeName);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text(
                            "+ Add Task",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: themeProvider.themeMode == ThemeMode.light
                    ? DatePicker(
                        DateTime.now(),
                        initialSelectedDate: DateTime.now(),
                        selectionColor: Theme.of(context).primaryColor,
                        selectedTextColor: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.13,
                        width: MediaQuery.of(context).size.height * 0.09,
                        onDateChange: (date) {
                          homeProvider.onDateChange(date);
                        },
                      )
                    : SizedBox(
                        child: DatePicker(
                          DateTime.now(),
                          initialSelectedDate: DateTime.now(),
                          selectionColor: Colors.orangeAccent,
                          selectedTextColor: Colors.white,
                          monthTextStyle: TextStyle(
                            color: Colors.white,
                          ),
                          dayTextStyle: TextStyle(
                            color: Colors.white,
                          ),
                          dateTextStyle: TextStyle(
                            color: Colors.white,
                          ),
                          height: MediaQuery.of(context).size.height * 0.13,
                          width: MediaQuery.of(context).size.height * 0.09,
                          onDateChange: (date) {
                            homeProvider.onDateChange(date);
                          },
                        ),
                      ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: StreamBuilder(
                  stream: FireBaseFunctions.getTasksFromFireStore(
                      homeProvider.dateTime),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Shimmer.fromColors(
                        baseColor:
                            Theme.of(context).brightness == Brightness.light
                                ? Colors.grey.shade300
                                : Colors.grey.shade900,
                        highlightColor:
                            Theme.of(context).brightness == Brightness.light
                                ? Colors.grey.shade100
                                : Colors.grey.shade800,
                        enabled: true,
                        child: const SingleChildScrollView(
                          physics: NeverScrollableScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              CuContainerShimmer(
                                width: double.infinity,
                                height: 100.0,
                              ),
                              SizedBox(height: 16.0),
                              CuContainerShimmer(
                                width: double.infinity,
                                height: 20.0,
                              ),
                              SizedBox(height: 16.0),
                              CuContainerShimmer(
                                width: double.infinity,
                                height: 40.0,
                              ),
                              SizedBox(height: 16.0),
                              CuContainerShimmer(
                                width: double.infinity,
                                height: 20.0,
                              ),
                              SizedBox(height: 16.0),
                              CuContainerShimmer(
                                width: 200,
                                height: 20.0,
                              ),
                              SizedBox(height: 16.0),
                              CuContainerShimmer(
                                width: double.infinity,
                                height: 80.0,
                              ),
                              SizedBox(height: 16.0),
                              CuContainerShimmer(
                                width: 200,
                                height: 20.0,
                              ),
                              SizedBox(height: 16.0),
                            ],
                          ),
                        ),
                      );
                    }
                    List<TaskModel> tasks = snapshot.data?.docs
                            .map((task) => task.data())
                            .toList() ??
                        [];
                    if (tasks.isEmpty) {
                      return Column(
                        children: [
                          themeProvider.themeMode == ThemeMode.light
                              ? Image.asset(
                                  "assets/empty_task.png",
                                )
                              : Image.asset(
                                  "assets/empty_task_dk.png",
                                ),
                          Text(
                            "Oops! You don't",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            "have any to do list today",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      );
                    }
                    tasks.sort((a, b) => a.startDate.compareTo(b.startDate));
                    homeProvider.maxStepValue = tasks.length - 1;

                    return Stepper(
                      key: ValueKey<int>(homeProvider.maxStepValue),
                      controlsBuilder: homeProvider.controlBuilders,
                      type: StepperType.vertical,
                      connectorThickness: 4,
                      // connectorColor:
                      //     MaterialStateProperty.all<Color>(Colors.grey),
                      currentStep: homeProvider.currentStep,
                      steps: tasks.map((task) {
                        final formattedTime = DateFormat('h:mm a').format(
                          DateTime(2024, 1, 1, task.startDate ~/ 60,
                              task.startDate % 60),
                        );

                        return Step(
                          title: Text(formattedTime),
                          content: TaskCard(task),
                          isActive: task.state,
                          state: task.state
                              ? StepState.complete
                              : StepState.disabled,
                        );
                      }).toList(),
                      onStepTapped: homeProvider.onStepTapped,
                      onStepContinue: homeProvider.continueStep,
                      onStepCancel: homeProvider.cancelStep,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}

class MenuItems {
  static const logout = MenuItem(text: 'Logout', icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.orangeAccent, size: 22),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: Colors.orangeAccent,
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item, Function toDo) {
    switch (item) {
      case MenuItems.logout:
        toDo();
        print('hi');
        break;
    }
  }
}
