// import 'package:flutter/material.dart';
//
// class AddTaskProvider extends ChangeNotifier {
//   TimeOfDay startTime = TimeOfDay.now();
//   TimeOfDay endTime = TimeOfDay.now();
//   var selected = DateUtils.dateOnly(
//     DateTime.now(),
//   );
//   int selectedAvatar = 0; // Index of the selected avatar
//
//   // List of avatar colors
//   final List<Color> avatarColors = [
//     Colors.red,
//     Colors.green,
//     Colors.blue,
//   ];
//
//   Color getColorBackground(int index) {
//     if (index == 0) {
//       return Colors.red;
//     } else if (index == 1) {
//       return Colors.green;
//     } else {
//       return Colors.blue;
//     }
//   }
//
//   var formKey = GlobalKey<FormState>();
//   TextEditingController titleController = TextEditingController();
//   TextEditingController noteController = TextEditingController();
//
//   void chooseDate(context) async {
//     DateTime? selectedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime.now().add(const Duration(days: 360 * 22)),
//     );
//     if (selectedDate != null) {
//       selected = DateUtils.dateOnly(selectedDate);
//       notifyListeners();
//     }
//   }
//
//   showStartTimePicker(context) {
//     showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     ).then((value) {
//       startTime = value!;
//       notifyListeners();
//     });
//   }
//
//   showEndTimePicker(context) {
//     showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     ).then((value) {
//       endTime = value!;
//       notifyListeners();
//     });
//   }
//
//   onCircleTap(index) {
//     selectedAvatar = index; // Set the selected index
//     notifyListeners();
//   }
// }
