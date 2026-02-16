import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'profile.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  static const String baseUrl = 'http://192.168.47.199:5000';

  Future<void> loginUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      final url = Uri.parse('$baseUrl/login');
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": emailController.text,
          "password": passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['message'] == "Login successful") {
          await fetchUserDetails(emailController.text);
        } else {
          showError("Unexpected response: ${response.body}");
        }
      } else {
        showError("Login failed: ${response.reasonPhrase}");
      }
    } catch (e) {
      showError("Network Error: Unable to connect to server");
    }

    setState(() => isLoading = false);
  }

  Future<void> fetchUserDetails(String email) async {
    try {
      final userUrl = Uri.parse('$baseUrl/user?email=$email');
      final userResponse = await http.get(userUrl);

      if (userResponse.statusCode == 200) {
        final userData = jsonDecode(userResponse.body);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', userData['email']);
        await prefs.setString('name', userData['name']);
        await prefs.setString('role', userData['role']);
        await prefs.setString('id', userData['_id']);

        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Profile(
              name: userData['name'],
              email: userData['email'],
            ),
          ),
        );
      } else {
        showError("Failed to fetch user details");
      }
    } catch (e) {
      showError("Login Succeed but Error fetching user data");
    }
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) =>
                  (value == null || value.isEmpty) ? 'Enter email' : null,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: "Password"),
                  obscureText: true,
                  validator: (value) =>
                  (value == null || value.isEmpty) ? 'Enter password' : null,
                ),
                const SizedBox(height: 20),
                isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: loginUser,
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
