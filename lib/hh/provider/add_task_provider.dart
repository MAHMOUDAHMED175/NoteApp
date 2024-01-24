import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddTaskProvider extends ChangeNotifier {
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  var selected = DateUtils.dateOnly(
    DateTime.now(),
  );
  int selectedAvatar = 0; // Index of the selected avatar

  // List of avatar colors
  final List<Color> avatarColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
  ];

  Color getColorBackground(int index) {
    if (index == 0) {
      return Colors.red;
    } else if (index == 1) {
      return Colors.green;
    } else {
      return Colors.blue;
    }
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  void chooseDate(context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 360 * 22)),
    );
    if (selectedDate != null) {
      selected = DateUtils.dateOnly(selectedDate);
      notifyListeners();
    }
  }

  showStartTimePicker(context) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      startTime = value!;
      notifyListeners();
    });
  }

  showEndTimePicker(context) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      endTime = value!;
      notifyListeners();
    });
  }

  onCircleTap(index) {
    selectedAvatar = index; // Set the selected index
    notifyListeners();
  }

  String selectedValue = "None"; // To keep track of the selected value

  void selectedValues(value) {
    selectedValue = value;
    notifyListeners();
  }

  String choose(String time) {
    if (time == "everyMinute") {
      return "RepeatInterval.everyMinute";
    } else if (time == "daily") {
      return "RepeatInterval.daily";
    } else if (time == "hourly") {
      return "RepeatInterval.hourly";
    } else {
      return "RepeatInterval.weekly";
    }
  }

  Future<void> sendPushMessage(
      {required String title,
      required String body,
      required String id,
      required int month,
      required int year,
      required int hour,
      required int day,
      required int minute,
      required int second,
      required String reapatedAndSchedule}) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAAyX8MaYs:APA91bH9CuhNhuUlGEMpcWGyjurDL2SLllFWjpASMXBHNoX-aZn7DL10OgmSAoQIe2b4Ii4RfMvPPE0ybCjnOkpjNQkgjb1oHQ_E4asAJY9dNSpQkjq_2j6KORPTkB6vH9pQxAr9C-P_',
        },
        body: jsonEncode(<String, dynamic>{
          'notification': {'body': body, 'title': title},
          'priority': 'high',
          'data': {
            "title": title,
            "id": id,
            "body": body,
            "month": "$month",
            "year": "$year",
            "hour": "$hour",
            "day": "$day",
            "minute": "$minute",
            "second": "$second",
            "reapatedAndSchedule": reapatedAndSchedule,
          },
          //هبعت الاشعار لمين
          //كدا هبعتها لنفسى
          "to": "${await FirebaseMessaging.instance.getToken()}"
          //كدا هبعتها للمشتركين فى topic
          // "to": "/topics/adfasdf"
        }),
      );
      print('FCM request for device sent');
    } catch (e) {
      print(e);
    }
  }
}
