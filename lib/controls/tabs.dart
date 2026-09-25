import 'package:flutter/material.dart';
import 'event_details.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,

      child: Scaffold(

        appBar: AppBar(
          title: const Text("TechFest Events"),

          bottom: const TabBar(
            tabs: [
              Tab(text: "All Events"),
              Tab(text: "Event 1"),
              Tab(text: "Event 2"),
            ],
          ),
        ),

        body: const TabBarView(
          children: [
            AllEvents(),
            Event1Details(),
            Event2Details(),
          ],
        ),
      ),
    );
  }
}


// TAB 1
class AllEvents extends StatelessWidget {
  const AllEvents({super.key});

  @override
  Widget build(BuildContext context) {

    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(10),

      crossAxisSpacing: 10,
      mainAxisSpacing: 10,

      children: [

        Card(
          child: Center(
            child: Text(
              "Code Clash",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),

        Card(
          child: Center(
            child: Text(
              "Robo Race",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),

      ],
    );
  }
}