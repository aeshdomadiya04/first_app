import 'package:flutter/material.dart';

class Event1Details extends StatelessWidget {
  const Event1Details({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // IMAGE 1
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.blue,
            child: const Center(
              child: Text(
                "CODE CLASH IMAGE 1",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ),

          // IMAGE 2
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.indigo,
            child: const Center(
              child: Text(
                "CODE CLASH IMAGE 2",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: const [
                Text(
                  "Code Clash",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),

                Text(
                  "Code Clash is a programming competition "
                  "where participants solve coding problems "
                  "within a limited time.",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Event2Details extends StatelessWidget {
  const Event2Details({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.orange,
            child: const Center(
              child: Text(
                "ROBO RACE IMAGE 1",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ),

          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepOrange,
            child: const Center(
              child: Text(
                "ROBO RACE IMAGE 2",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: const [
                Text(
                  "Robo Race",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),

                Text(
                  "Robo Race is a robotics competition "
                  "where participants control robots and "
                  "complete the given track as quickly as possible.",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
