import 'package:flutter/material.dart';

class DropDownExample extends StatefulWidget {
  const DropDownExample({super.key});

  @override
  State<DropDownExample> createState() => _DropDownExampleState();
}

class _DropDownExampleState extends State<DropDownExample> {
  String unit = "Unit 1";

  void setDropDownValue() {
    setState(() {
      unit = "Unit 3";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: unit,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: "Unit 1", child: Text("Unit 1")),
                DropdownMenuItem(value: "Unit 2", child: Text("Unit 2")),
                DropdownMenuItem(value: "Unit 3", child: Text("Unit 3")),
              ],
              onChanged: (v) => setState(() {
                unit = v!;
              }),
            ),
            Text("Selected value: $unit"),
            ElevatedButton(
              onPressed: setDropDownValue,
              child: const Text('Set dropdown to Unit 3'),
            ),
          ],
        ),
      ),
    );
  }
}
