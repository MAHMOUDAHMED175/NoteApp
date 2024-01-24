// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:todo/hh/model/task_model.dart';
//
// import '../firebase/firebase_functions.dart';
// import '../home_layout/home_layout.dart';
// import '../provider/add_task_provider.dart';
// import '../reusable/widget/cu_text_form_field.dart';
//
// class AddTaskScreen extends StatelessWidget {
//   AddTaskScreen({Key? key}) : super(key: key);
//   static const String routeName = "addTaskScreen";
//
//   @override
//   Widget build(BuildContext context) {
//     var addTaskProvider = Provider.of<AddTaskProvider>(context);
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Form(
//               key: addTaskProvider.formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       InkWell(
//                         focusColor: Colors.transparent,
//                         hoverColor: Colors.transparent,
//                         highlightColor: Colors.transparent,
//                         splashColor: Colors.transparent,
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Icon(
//                           Icons.arrow_back_ios,
//                           size: 20,
//                         ),
//                       ),
//                       const Spacer(),
//                       Text(
//                         "ذكرنى",
//                         style: GoogleFonts.quicksand(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "Add Task",
//                     style: GoogleFonts.quicksand(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w900,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     "Title",
//                     style: Theme.of(context).textTheme.headlineSmall,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   CuTextField(
//                     title: "Enter title here",
//                     controller: addTaskProvider.titleController,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please Enter Task Title";
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     "Note",
//                     style: Theme.of(context).textTheme.headlineSmall,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   CuTextField(
//                     title: "Enter note here",
//                     controller: addTaskProvider.noteController,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please Enter Task Description";
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     "Date",
//                     style: Theme.of(context).textTheme.headlineSmall,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   CuTime(
//                     addTaskProvider.selected.toString().substring(0, 10),
//                     FontAwesomeIcons.solidCalendarDays,
//                     onTap: () {
//                       addTaskProvider.chooseDate(context);
//                     },
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Row(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Start Time",
//                             style: Theme.of(context).textTheme.labelLarge,
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           CuTime(
//                             addTaskProvider.startTime
//                                 .format(context)
//                                 .toString(),
//                             FontAwesomeIcons.clock,
//                             width: MediaQuery.of(context).size.width * .36,
//                             height: 60,
//                             onTap: () =>
//                                 addTaskProvider.showStartTimePicker(context),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "End Time",
//                             style: Theme.of(context).textTheme.labelLarge,
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           CuTime(
//                             addTaskProvider.endTime.format(context).toString(),
//                             FontAwesomeIcons.clock,
//                             width: MediaQuery.of(context).size.width * .36,
//                             height: 60,
//                             onTap: () =>
//                                 addTaskProvider.showEndTimePicker(context),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     "Repeat",
//                     style: Theme.of(context).textTheme.headlineSmall,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   CuDrop(
//                     item: const [
//                       "daily",
//                       "weakly",
//                       "monthly",
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Color",
//                             style: Theme.of(context).textTheme.headlineSmall,
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: List.generate(3, (index) {
//                               return Padding(
//                                 padding: const EdgeInsets.only(right: 8.0),
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     addTaskProvider.onCircleTap(index);
//                                   },
//                                   child: CircleAvatar(
//                                     backgroundColor:
//                                         addTaskProvider.avatarColors[index],
//                                     radius: 14.0,
//                                     child: Icon(
//                                       Icons.check,
//                                       color: Colors.white,
//                                       size: addTaskProvider.selectedAvatar ==
//                                               index
//                                           ? 20.0
//                                           : 0.0, // Show checkmark if selected
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             }),
//                           ),
//                         ],
//                       ),
//                       const Spacer(),
//                       SizedBox(
//                         height: 50,
//                         child: ElevatedButton(
//                           style: ButtonStyle(
//                             shape: MaterialStateProperty.all<OutlinedBorder>(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12.0),
//                               ),
//                             ),
//                           ),
//                           onPressed: () async {
//                             // ++iDifrrent;
//                             // print("$iDifrrent ssssssssssssssssssssss");
//                             // iDifrrent++;
//                             // print("$iDifrrent ddddddddddddddd");
//                             if (addTaskProvider.formKey.currentState!
//                                 .validate()) {
//                               TaskModel task = TaskModel(
//                                 idColor: addTaskProvider.selectedAvatar,
//                                 userId: FirebaseAuth.instance.currentUser!.uid,
//                                 title: addTaskProvider.titleController.text,
//                                 description:
//                                     addTaskProvider.noteController.text,
//                                 state: false,
//                                 date: addTaskProvider
//                                     .selected.millisecondsSinceEpoch,
//                                 endDate: addTaskProvider.endTime.hour * 60 +
//                                     addTaskProvider.endTime.minute,
//                                 // Convert TimeOfDay to int
//                                 startDate: addTaskProvider.startTime.hour * 60 +
//                                     addTaskProvider.startTime.minute,
//                               );
//                               FireBaseFunctions.addTask(task).then(
//                                 (value) => Navigator.pushNamed(
//                                     context, HomeScreen.routeName),
//                               );
//                             }
//                             // await NotificationService.showNotificationperioid(
//                             //   idDiffrient: Uuid().v4().codeUnitAt(0),
//                             //   title: addTaskProvider.titleController.text,
//                             //   body: addTaskProvider.noteController.text,
//                             //   icon: "moon_icon",
//                             //   repeatInterval: RepeatInterval.everyMinute,
//                             //   payload: "اتق الله حيثما كنت",
//                             //   // summary: "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww",
//                             //   // DateTime(
//                             //   //   addTaskProvider.selected.year,
//                             //   //   addTaskProvider.selected.month,
//                             //   //   addTaskProvider.selected.day,
//                             //   //   addTaskProvider.startTime.hour,
//                             //   //   addTaskProvider.startTime.minute,
//                             //   //   addTaskProvider.selected.second,
//                             //   // ),
//                             // );
//                           },
//                           child: const Padding(
//                             padding: EdgeInsets.all(2.0),
//                             child: Text(
//                               "Create Task",
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
