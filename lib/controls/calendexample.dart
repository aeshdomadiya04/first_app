// TODO Implement this library.
import 'package:flutter/material.dart';

class Calenderexample extends StatefulWidget {
  const Calenderexample({super.key});

  @override
  State<Calenderexample> createState() => _CalenderexampleState();
}

class _CalenderexampleState extends State<Calenderexample> {
  DateTime? data;

  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: data ?? DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        data = picked;
      });
    }
  }

  void setDateValue() {
    setState(() {
      data = DateTime(2024, 1, 1);
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
            Text(
              data == null ? "No Date" : "${data!.day}/${data!.month}/${data!.year}",
            ),
            ElevatedButton(
              onPressed: pickDate,
              child: const Text('Pick Date'),
            ),
          ],
        ),
      ),
    );
  }
}