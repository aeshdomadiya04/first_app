import 'package:flutter/material.dart';
import 'result.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  // Form key
  final formKey = GlobalKey<FormState>();

  // Controllers
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final rePassword = TextEditingController();

  // Gender
  String gender = "Male";

  // Qualification
  bool q10 = false;
  bool q12 = false;
  bool graduation = false;

  // City
  String? city;

  // Height
  double height = 48;

  // Date of Birth
  DateTime? dob;

  // Date Picker
  Future<void> selectDate() async {

    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime(2005),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {
        dob = date;
      });
    }
  }

  // Submit
  void submit() {

    if (!formKey.currentState!.validate()) {
      return;
    }

    // Qualification validation
    if (!q10 && !q12 && !graduation) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Select at least one qualification"),
        ),
      );
      return;
    }

    // Gender is already selected
    // City validation
    if (city == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select city"),
        ),
      );
      return;
    }

    // DOB validation
    if (dob == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select date of birth"),
        ),
      );
      return;
    }

    // Navigate to next page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          username: username.text,
          email: email.text,
          gender: gender,
          qualification: getQualification(),
          city: city!,
          height: height,
          dob: dob!,
        ),
      ),
    );
  }

  // Get selected qualifications
  String getQualification() {

    List<String> list = [];

    if (q10) {
      list.add("10th");
    }

    if (q12) {
      list.add("12th");
    }

    if (graduation) {
      list.add("Graduation");
    }

    return list.join(", ");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
      ),

      body: Form(
        key: formKey,

        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [

              // USERNAME
              TextFormField(
                controller: username,

                decoration: const InputDecoration(
                  labelText: "User Name",
                  border: OutlineInputBorder(),
                ),

                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return "Enter username";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              // EMAIL
              TextFormField(
                controller: email,

                keyboardType: TextInputType.emailAddress,

                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),

                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return "Enter email";
                  }

                  if (!value.contains("@")) {
                    return "Enter valid email";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              // PASSWORD
              TextFormField(
                controller: password,

                obscureText: true,

                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),

                validator: (value) {

                  if (value == null || value.length < 10) {
                    return "Password must have 10 characters";
                  }

                  int capital =
                      RegExp(r'[A-Z]').allMatches(value).length;

                  int small =
                      RegExp(r'[a-z]').allMatches(value).length;

                  int number =
                      RegExp(r'[0-9]').allMatches(value).length;

                  int special =
                      RegExp(r'[^A-Za-z0-9]').allMatches(value).length;

                  if (capital < 3) {
                    return "Need 3 capital letters";
                  }

                  if (small < 3) {
                    return "Need 3 small letters";
                  }

                  if (number < 2) {
                    return "Need 2 numbers";
                  }

                  if (special < 2) {
                    return "Need 2 special characters";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              // RE-ENTER PASSWORD
              TextFormField(
                controller: rePassword,

                obscureText: true,

                decoration: const InputDecoration(
                  labelText: "Re-enter Password",
                  border: OutlineInputBorder(),
                ),

                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return "Re-enter password";
                  }

                  if (value != password.text) {
                    return "Password does not match";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              // GENDER
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Gender",
                  style: TextStyle(fontSize: 16),
                ),
              ),

              RadioListTile(
                title: const Text("Male"),
                value: "Male",
                groupValue: gender,

                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),

              RadioListTile(
                title: const Text("Female"),
                value: "Female",
                groupValue: gender,

                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),

              // QUALIFICATION
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Qualification",
                  style: TextStyle(fontSize: 16),
                ),
              ),

              CheckboxListTile(
                title: const Text("10th"),
                value: q10,

                onChanged: (value) {
                  setState(() {
                    q10 = value!;
                  });
                },
              ),

              CheckboxListTile(
                title: const Text("12th"),
                value: q12,

                onChanged: (value) {
                  setState(() {
                    q12 = value!;
                  });
                },
              ),

              CheckboxListTile(
                title: const Text("Graduation"),
                value: graduation,

                onChanged: (value) {
                  setState(() {
                    graduation = value!;
                  });
                },
              ),

              const SizedBox(height: 10),

              // CITY
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "City",
                  border: OutlineInputBorder(),
                ),

                items: const [
                  DropdownMenuItem(
                    value: "City 1",
                    child: Text("City 1"),
                  ),

                  DropdownMenuItem(
                    value: "City 2",
                    child: Text("City 2"),
                  ),

                  DropdownMenuItem(
                    value: "City 3",
                    child: Text("City 3"),
                  ),
                ],

                onChanged: (value) {
                  setState(() {
                    city = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              // HEIGHT
              Text(
                "Height: ${height.toInt()} inch",
                style: const TextStyle(fontSize: 16),
              ),

              Slider(
                value: height,
                min: 48,
                max: 84,
                divisions: 36,

                onChanged: (value) {
                  setState(() {
                    height = value;
                  });
                },
              ),

              const SizedBox(height: 10),

              // DATE OF BIRTH
              ListTile(
                title: Text(
                  dob == null
                      ? "Select Date of Birth"
                      : "DOB: ${dob!.day}/${dob!.month}/${dob!.year}",
                ),

                trailing: ElevatedButton(
                  onPressed: selectDate,
                  child: const Text("Select"),
                ),
              ),

              const SizedBox(height: 20),

              // SUBMIT
              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: submit,
                  child: const Text("SUBMIT"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}