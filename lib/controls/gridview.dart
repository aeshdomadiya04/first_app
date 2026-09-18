import 'package:flutter/material.dart';

class GridExample extends StatefulWidget {
  const GridExample({super.key});

  @override
  State<GridExample> createState() => _GridExampleState();
}

class _GridExampleState extends State<GridExample> {
  final topics = [
    'Topic1',
    'Topic2',
    'Topic3',
    'Topic4',
    'Topic5',
    'Topic6',
    'Topic7',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            for (var topic in topics)
              Card(
                color: Colors.blue.shade400,
                child: Center(
                  child: Text(topic),
                ),
              ),
          ],
        ),
      ),
    );
  }
}