import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://reqres.in/api';

  Future<Map<String, dynamic>> registerUser(
      String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      // Successful registration
      return json.decode(response.body);
    } else {
      // Handle error
      throw Exception('Failed to register user');
    }
  }
}
