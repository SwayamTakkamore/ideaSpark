import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _selectedRole = "student";
  final TextEditingController _expertiseController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _registerUser() async {
    if (!_formKey.currentState!.validate()) return;

    final String name = _nameController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final List<String> expertise = _expertiseController.text.split(',');

    final response = await http.post(
      Uri.parse('http://192.168.47.199:5000/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'role': _selectedRole,
        'expertise': expertise,
      }),
    );

    final responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registration successful!")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(responseData['error'] ?? 'Registration failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) => value!.isEmpty ? 'Enter your name' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) => value!.isEmpty ? 'Enter a valid email' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) => value!.length < 6 ? 'Password must be at least 6 characters' : null,
              ),
              DropdownButtonFormField(
                value: _selectedRole,
                items: [
                  DropdownMenuItem(value: "student", child: Text("Student")),
                  DropdownMenuItem(value: "mentor", child: Text("Mentor")),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedRole = value.toString();
                  });
                },
                decoration: InputDecoration(labelText: 'Role'),
              ),
              TextFormField(
                controller: _expertiseController,
                decoration: InputDecoration(labelText: 'Expertise (comma separated)'),
                validator: (value) => _selectedRole == 'mentor' && value!.isEmpty ? 'Enter expertise' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _registerUser,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
