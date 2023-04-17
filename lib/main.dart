import 'package:flutter/material.dart';

import './task_list.dart';

void main() {
  runApp(const MainApp());
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
  final _tasks = const [
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
                  tasks: _tasks,
                ),
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
      _perc = 100 * _comp / _tasks.length;
      _perc = double.parse((_perc).toStringAsFixed(2));
      _progress = 1 * _perc / 100;
    });
  }
}
