import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/hh/firebase/firebase_functions.dart';
import 'package:todo/hh/model/task_model.dart';
import 'package:todo/hh/provider/add_task_provider.dart';
import 'package:todo/hh/screens/edit_task_screen.dart';

import '../../provider/themeProvider.dart';

class TaskCard extends StatefulWidget {
  final TaskModel task;

  const TaskCard(this.task, {super.key});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var firebaseFun = Provider.of<FireBaseFunctions>(context);
    var addTaskProvider = Provider.of<AddTaskProvider>(context);
    final formattedStartTime = DateFormat('h:mm a').format(
      DateTime(
          2024, 1, 1, widget.task.startDate ~/ 60, widget.task.startDate % 60),
    );
    final formattedEndTime = DateFormat('h:mm a').format(
      DateTime(2024, 1, 1, widget.task.endDate ~/ 60, widget.task.endDate % 60),
    );
    return Card(
      color: addTaskProvider
          .getColorBackground(widget.task.idColor)
          .withOpacity(0.5),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      elevation: 20,
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 1,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              autoClose: true,
              onPressed: (context) {
                firebaseFun.deleteTask(widget.task.id);
              },
              backgroundColor: const Color(0xFFFE4A49),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              autoClose: true,
              onPressed: (context) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return EditTaskScreen(widget.task.id);
                    },
                  ),
                );
              },
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          5.0), // Adjust the radius as needed
                      color: widget.task.state
                          ? Colors.lightBlueAccent
                          : Colors.lightBlueAccent,
                    ),
                    width: 5,
                    height: MediaQuery.of(context).size.height * .09,
                    child: const VerticalDivider(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.task.title,
                        style: widget.task.state
                            ? Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300)
                            : Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.clock,
                            size: 20,
                            color: themeProvider.themeMode == ThemeMode.light
                                ? Colors.white
                                : Colors.lightBlueAccent,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            formattedStartTime,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            formattedEndTime,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.task.description,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w100),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                  // const Spacer(),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              widget.task.state
                  ? const Icon(
                      Icons.done,
                      size: 40,
                      color: Colors.green,
                    )
                  : ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(
                          () {
                            widget.task.state = true;
                            firebaseFun.updateTask(widget.task.id, widget.task);
                          },
                        );
                      },
                      child: const Icon(
                        Icons.done,
                        color: Colors.grey,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
