import 'package:flutter/material.dart';

import 'task_item.dart';

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
  final int _n = 4;
  int _comp = 0;

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
              TaskItem(
                label: "Comprare lo zucchero",
                onCheck: onSonChange,
              ),
              TaskItem(
                label: "Colloquio parenti",
                onCheck: onSonChange,
              ),
              TaskItem(
                label: "Revisione macchina",
                onCheck: onSonChange,
              ),
              TaskItem(
                label: "Pagamento rifiuti",
                onCheck: onSonChange,
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
      _perc = 100 * _comp / _n;
      _progress = 1 * _perc / 100;
    });
  }
}
