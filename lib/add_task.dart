import 'package:flutter/material.dart';

class AddItem extends StatelessWidget {
  final Function addTask;
  const AddItem({super.key, required this.addTask});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aggiungi un task'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Aggiungi un nuovo task',
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  addTask('Prova');
                  Navigator.pop(context);
                },
                child: const Text('Aggiungi task!'),
              ),
            )
          ]),
    );
  }
}
