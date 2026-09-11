import 'package:flutter/material.dart';

class CalendExample extends StatefulWidget {
  const CalendExample({super.key});

  @override
  State<CalendExample> createState() =>  CalendExampleState();
}

class  CalendExampleState extends State<CalendExample> {
  DateTime? data;
  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (!mounted || picked == null) return;
    setState(() => data = picked);
  }
  void setDateValue() {
    setState(() {
      data = DateTime(2024, 1, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final text = data == null ? "No Date" : "${data!.day}/${data!.month}/${data!.year}";
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(text),
            ElevatedButton(
              onPressed: pickDate,
              child: const Text('Pick Date'),
            ),
            ElevatedButton(
              onPressed: setDateValue,
              child: const Text('Set date to 01/01/2024'),
            ),
          ],
        ),
      ),
    );
  }
}