import 'package:flutter/material.dart';

class TaskItem extends StatefulWidget {
  //attributi della classe
  final String label;
  final Function onCheck;

  //costruttore della classe
  const TaskItem({super.key, required this.label, required this.onCheck});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool? _value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: _value,
            onChanged: (newvalue) =>
                {widget.onCheck(newvalue), _value = newvalue}),
        Text(widget.label)
      ],
    );
  }
}
