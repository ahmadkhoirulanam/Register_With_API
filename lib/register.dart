import 'package:flutter/material.dart';
import 'package:register/main.dart';
import 'api_service.dart';

void main() {
  runApp(Register());
}

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService apiService = ApiService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _registerUser() async {
    final email = emailController.text;
    final password = passwordController.text;

    try {
      final response = await apiService.registerUser(email, password);
      print('Registration successful: $response');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
    } catch (e) {
      print('Registration failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reqres.in Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _registerUser,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
