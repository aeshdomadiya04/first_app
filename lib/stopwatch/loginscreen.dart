import 'package:flutter/material.dart';

class loginwidget extends StatefulWidget {
  const loginwidget({super.key});

  @override
  State<loginwidget> createState() => _loginwidgetState();
}

class _loginwidgetState extends State<loginwidget> {
  bool _isLoggedIn = false;

  String name = '';
  String email = '';

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Widget _buildSuccess() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 100,
        ),
        const SizedBox(height: 20),
        Text(
          'Welcome, $name!',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 10),
        Text(
          'Email: $email',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Username cannot be blank';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Email cannot be blank';
                }

                final emailRegex =
                    RegExp(r'^[^@]+@[^@]+\.[^@]+');

                if (!emailRegex.hasMatch(text)) {
                  return 'Invalid email format';
                }

                return null;
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    name = _nameController.text;
                    email = _emailController.text;
                    _isLoggedIn = true;
                  });
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }


void _validate() {
  final form = _formKey.currentState;
  if (form!.validate()) {
    setState(() {
      
      _isLoggedIn = true;
      name = _nameController.text;
      email = _emailController.text;
    });
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: _isLoggedIn
            ? _buildSuccess()
            : _buildLoginForm(),
      ),
    );
  }
}