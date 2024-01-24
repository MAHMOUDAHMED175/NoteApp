// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:todo/hh/model/task_model.dart';
// import 'package:todo/hh/provider/edit_task_provider.dart';
//
// import '../firebase/firebase_functions.dart';
// import '../reusable/widget/cu_text_form_field.dart';
//
// class UpdateForm extends StatefulWidget {
//   const UpdateForm({super.key, required this.taskModel});
//   final TaskModel taskModel;
//   @override
//   State<UpdateForm> createState() => _UpdateFormState();
// }
//
// class _UpdateFormState extends State<UpdateForm> {
//   final titleController = TextEditingController();
//   final descriptionController = TextEditingController();
//   late final String taskId;
//   late final TimeOfDay startDate;
//   late final TimeOfDay endDate;
//
//   @override
//   void initState() {
//     titleController.text = widget.taskModel.title;
//     descriptionController.text = widget.taskModel.description;
//     taskId = widget.taskModel.id;
//     startDate = TimeOfDay(
//         hour: widget.taskModel.startDate ~/ 60,
//         minute: widget.taskModel.startDate % 60);
//     endDate = TimeOfDay(
//         hour: widget.taskModel.endDate ~/ 60,
//         minute: widget.taskModel.endDate % 60);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var editProvider = Provider.of<EditTaskProvider>(context);
//     var firebaseFun = Provider.of<FireBaseFunctions>(context);
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Form(
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
//                     "Edit Task",
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
//                     controller: titleController,
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
//                     controller: descriptionController,
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
//                     editProvider.selected.toString().substring(0, 10),
//                     FontAwesomeIcons.solidCalendarDays,
//                     onTap: () {
//                       editProvider.chooseDate(context);
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
//                             editProvider.startTime.format(context).toString(),
//                             FontAwesomeIcons.clock,
//                             width: MediaQuery.of(context).size.width * .44,
//                             height: 50,
//                             onTap: () => editProvider.showStartTimePicker(
//                               context,
//                               startDate,
//                             ),
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
//                             editProvider.endTime.format(context).toString(),
//                             FontAwesomeIcons.clock,
//                             width: MediaQuery.of(context).size.width * .44,
//                             height: 50,
//                             onTap: () => editProvider.showEndTimePicker(
//                               context,
//                               endDate,
//                             ),
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
//                                     editProvider.onCircleTap(index);
//                                   },
//                                   child: CircleAvatar(
//                                     backgroundColor:
//                                         editProvider.avatarColors[index],
//                                     radius: 14.0,
//                                     child: Icon(
//                                       Icons.check,
//                                       color: Colors.white,
//                                       size: editProvider.selectedAvatar == index
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
//                           onPressed: () {
//                             TaskModel task = TaskModel(
//                               idColor: editProvider.selectedAvatar,
//                               id: widget.taskModel.id,
//                               userId: widget.taskModel.userId,
//                               title: titleController.text,
//                               description: descriptionController.text,
//                               state: widget.taskModel.state,
//                               date:
//                                   editProvider.selected.millisecondsSinceEpoch,
//                               endDate: editProvider.endTime.hour * 60 +
//                                   editProvider.endTime
//                                       .minute, // Convert TimeOfDay to int
//                               startDate: editProvider.startTime.hour * 60 +
//                                   editProvider.startTime.minute,
//                             );
//                             firebaseFun.updateTask(taskId, task).then(
//                                   (value) => Navigator.pop(
//                                     context,
//                                   ),
//                                 );
//                           },
//                           child: const Padding(
//                             padding: EdgeInsets.all(2.0),
//                             child: Text(
//                               "Save Changes",
//                               style: TextStyle(color: Colors.white),
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
