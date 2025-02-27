import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<void> signUp({required String email, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final String baseUrl = "http://localhost:5001";

  @override
  Future<void> signUp({required String email, required String password}) async {
    final url = Uri.parse('$baseUrl/api/auth/signup');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to sign up: ${response.body}');
    }
  }
}
