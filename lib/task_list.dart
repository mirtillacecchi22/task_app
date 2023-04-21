import 'package:flutter/material.dart';

import 'task_item.dart';
import './task_model.dart';

class TasksList extends StatelessWidget {
  final TaskModel tasks;
  //final Function onSonChange;

  const TasksList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: tasks.totalTasks,
        itemBuilder: (BuildContext context, int index) {
          return TaskItem(
            label: tasks.getTask(index),
            onCheck: (value) => tasks.checkTask(value),
          );
        });
  }
}
