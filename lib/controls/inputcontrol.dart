import 'package:flutter/material.dart';

class TextBoxDemo extends StatefulWidget {
  const TextBoxDemo({super.key});

  @override
  State<TextBoxDemo> createState() => _TextBoxDemoState();
}

class _TextBoxDemoState extends State<TextBoxDemo> {
  final textcontroller = TextEditingController();

  @override
  void dispose() {
    textcontroller.dispose();
    super.dispose();
  }

  void setText() {
    setState(() {
      textcontroller.text = 'Hello World!';
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
            TextField(
              controller: textcontroller,
              decoration: const InputDecoration(
                labelText: 'Enter text',
                border: OutlineInputBorder(),
              ),
              onChanged: (__) => setState(() {}),
            ),
            Text('Read Text: ${textcontroller.text}'),
            ElevatedButton(onPressed: setText, child: const Text('Set Text')),
          ],
        ),
      ),
    );
  }
}
