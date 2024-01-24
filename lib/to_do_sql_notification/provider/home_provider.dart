// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todo/hh/provider/themeProvider.dart';
//
// class HomeProvider extends ChangeNotifier {
//   // Create a Stepper widget to order the tasks by timer.
//   List<Step> steps = [];
//
//   DateTime dateTime = DateTime.now();
//
//   int currentStep = 0;
//
//   int maxStepValue = 0; // Maximum step value
//
//   continueStep() {
//     if (currentStep < maxStepValue) {
//       currentStep += 1;
//       notifyListeners();
//     }
//   }
//
//   cancelStep() {
//     if (currentStep > 0) {
//       currentStep -= 1;
//       notifyListeners();
//     }
//   }
//
//   updateMaxStepValue(int value) {
//     maxStepValue = value;
//     notifyListeners();
//   }
//
//   onStepTapped(int value) {
//     currentStep = value;
//     notifyListeners();
//   }
//
//   Widget controlBuilders(context, details) {
//     var themeProvider = Provider.of<ThemeProvider>(context);
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           ElevatedButton(
//             style:
//                 ElevatedButton.styleFrom(backgroundColor: Colors.indigoAccent),
//             onPressed: currentStep < maxStepValue ? continueStep : null,
//             child: Text(
//               'Next',
//               style: TextStyle(
//                   color: themeProvider.themeMode == ThemeMode.light
//                       ? Colors.white
//                       : Colors.white),
//             ),
//           ),
//           const SizedBox(width: 10),
//           OutlinedButton(
//             onPressed: details.onStepCancel,
//             child: Text(
//               'Back',
//               style: TextStyle(
//                   color: themeProvider.themeMode == ThemeMode.light
//                       ? Colors.grey
//                       : Colors.limeAccent),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   onDateChange(date) {
//     dateTime = date;
//     steps = [];
//     currentStep = 0;
//     maxStepValue = 0;
//     notifyListeners();
//   }
// }
