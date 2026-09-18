import 'package:flutter/material.dart';
import 'package:first_app/stopwatch/loginscreen.dart';
import 'package:first_app/controls/scrollviewimage.dart';

class TabExample extends StatefulWidget {
  const TabExample({super.key});

  @override
  State<TabExample> createState() => _TabExampleState();
}

class _TabExampleState extends State<TabExample> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Tab 1'),
              Tab(icon: Icon(Icons.settings), text: 'Tab 2'),
              Tab(icon: Icon(Icons.message_sharp), text: 'Tab 3'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: loginwidget()),
            Center(child: ScrollImage()),
            Center(child: Text('Messages')),
          ],
        ),
      ),
    );
  }
}
