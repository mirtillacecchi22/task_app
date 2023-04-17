import 'package:flutter/material.dart';

import './task_list.dart';
import './add_task.dart';

void main() {
  runApp(const MaterialApp(
      home: MainApp())); //soluzione per usare Navigator, da rivedere
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double _perc = 0;
  double _progress = 0;
  int _comp = 0;

  //lista dei tasks hardcoded
  List<String> tasks = [
    'Comprare lo zucchero',
    'Colloquio parenti',
    'Revisione macchina',
    'Pagamento rifiuti',
    'Spesa',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Task App"),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
                width: double.infinity,
              ),
              Text("Task completati $_perc%"),
              const SizedBox(
                height: 10,
                width: double.infinity,
              ),
              LinearProgressIndicator(
                value: _progress,
              ),
              Expanded(
                child: TasksList(
                  onSonChange: onSonChange,
                  tasks: tasks,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddItem(addTask: aggiungiTask)),
                  );
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSonChange(value) {
    setState(() {
      if (value) {
        _comp += 1;
      } else {
        _comp -= 1;
      }
      _perc = 100 * _comp / tasks.length;
      _perc = double.parse((_perc).toStringAsFixed(2));
      _progress = 1 * _perc / 100;
    });
  }

  void aggiungiTask(value) {
    setState(() {
      tasks.add(value);
    });
  }
}
