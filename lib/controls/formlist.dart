import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class formList extends StatefulWidget {
  const formList({super.key});

  @override
  State<formList> createState() => _formListState();
}

class _formListState extends State<formList> {
  final nameCtrl = TextEditingController();
  String gender = 'M';
  bool agree = false;
   List<Map<String, dynamic>> items = [];
   static const _Key = 'entries';

  Future<void> _load() async {
    final pref = await SharedPreferences.getInstance();
     final raw = pref.getString(_Key);
    if (raw == null) return;
    final list = jsonDecode(raw) as List;
    setState(() {
      items = list.cast<Map<String, dynamic>>();
    });
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if(nameCtrl.text.trim().isEmpty) return;
    items.add({
      'name': nameCtrl.text,
      'gender': gender,
      'agree': agree,
    });

    final pref = await SharedPreferences.getInstance();
    await pref.setString(_Key, jsonEncode(items));

    nameCtrl.text = '';
    setState(() {
      gender = 'M';
      agree = false;
    });
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),

            RadioListTile<String>(
              title: const Text('Male'),
              value: 'M',
              groupValue: gender,
              onChanged: (v) => setState(() {gender = v!;}),),

            RadioListTile<String>(
              title: const Text('Female'),
              value: 'F',
              groupValue: gender,
              onChanged: (v) => setState(() { gender = v!;}), ),

            CheckboxListTile(
              title: const Text('I Agree'),
              value: agree,
              onChanged: (v) => setState(() {agree = v!; }),),

            ElevatedButton(
              onPressed: _save,
              child: const Text('Save'),
            ),
            SizedBox(height: 10),
            Expanded(child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text('Gender: ${item['gender']}, Agree: ${item['agree']}'),
                );
              },
            ),)

          ]

        ),


      )
    );
  }
}