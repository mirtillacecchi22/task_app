import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  //final Function addTask;

  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final taskController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aggiungi un task'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: taskController,
                )),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  //Provider.of<TaskModel>(context).add(taskController.text);
                  //tasks.add(taskController.text);
                  Navigator.pop(context, taskController.text);
                },
                child: const Text('Aggiungi task!'),
              ),
            ),
          ]),
    );
  }
}
