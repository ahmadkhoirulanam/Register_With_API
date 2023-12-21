import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:register/home.dart';
import 'package:register/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _login() async {
    final response = await http.post(
      Uri.parse('https://reqres.in/api/login'),
      body: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      // Login berhasil, Anda dapat menangani respons di sini
      print('Login berhasil!');
      print(jsonDecode(response.body));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else {
      // Login gagal, Anda dapat menangani respons atau memberikan umpan balik ke pengguna di sini
      print('Login gagal!');
      print(jsonDecode(response.body));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("login Page"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  children: [
                    Text("belum Punya Akun ?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: Text("Register"))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
