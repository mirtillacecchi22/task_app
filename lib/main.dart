import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './task_list.dart';
import './add_task.dart';
import './task_model.dart';

void main() {
  runApp(const MaterialApp(
      home: MainApp())); //soluzione per usare Navigator, da rivedere
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Task App"),
        ),
        body: ChangeNotifierProvider(
          create: (context) => TaskModel(),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Consumer<TaskModel>(
                builder: (context, tasks, child) => Column(
                      children: [
                        const SizedBox(
                          height: 10,
                          width: double.infinity,
                        ),
                        Text("Task completati ${tasks.perc}%"),
                        const SizedBox(
                          height: 10,
                          width: double.infinity,
                        ),
                        LinearProgressIndicator(
                          value: tasks.progress,
                        ),
                        Expanded(
                          child: TasksList(
                            tasks: tasks,
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const AddItem()))
                                .then((value) => tasks.add(value));
                          },
                          child: const Icon(Icons.add),
                        ),
                      ],
                    )),
          ),
        ),
      ),
    );
  }
}
