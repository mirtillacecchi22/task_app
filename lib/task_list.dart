import 'package:flutter/material.dart';

import 'task_item.dart';

class TasksList extends StatelessWidget {
  final List tasks;
  final Function onSonChange;

  const TasksList({super.key, required this.onSonChange, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return TaskItem(
            label: tasks[index],
            onCheck: onSonChange,
          );
        });
  }
}
