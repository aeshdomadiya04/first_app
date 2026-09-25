import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String username;
  final String email;
  final String gender;
  final String qualification;
  final String city;
  final double height;
  final DateTime dob;

  const ResultPage({
    super.key,
    required this.username,
    required this.email,
    required this.gender,
    required this.qualification,
    required this.city,
    required this.height,
    required this.dob,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Information")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "Registration Successful",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Text("User Name : $username"),

            const SizedBox(height: 10),

            Text("Email : $email"),

            const SizedBox(height: 10),

            Text("Gender : $gender"),

            const SizedBox(height: 10),

            Text("Qualification : $qualification"),

            const SizedBox(height: 10),

            Text("City : $city"),

            const SizedBox(height: 10),

            Text("Height : ${height.toInt()} inch"),

            const SizedBox(height: 10),

            Text(
              "Date of Birth : "
              "${dob.day}/${dob.month}/${dob.year}",
            ),
          ],
        ),
      ),
    );
  }
}
