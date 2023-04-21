import 'package:flutter/material.dart';

class TaskModel extends ChangeNotifier {
  final List<String> _tasks = [];
  double _perc = 0;
  double _progress = 0;
  int _comp = 0;

  int get totalTasks => _tasks.length;
  String get perc => "$_perc";
  double get progress => _progress;

  String getTask(index) => _tasks[index];

  void add(String item) {
    _tasks.add(item);
    _perc = 100 * _comp / _tasks.length;
    _perc = double.parse((_perc).toStringAsFixed(2));
    _progress = 1 * _perc / 100;
    notifyListeners();
  }

  void checkTask(value) {
    if (value) {
      _comp += 1;
    } else {
      _comp -= 1;
    }
    _perc = 100 * _comp / _tasks.length;
    _perc = double.parse((_perc).toStringAsFixed(2));
    _progress = 1 * _perc / 100;
    notifyListeners();
  }
}
