import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_template/data/model/requests/login_request.dart';
import 'package:flutter_template/data/model/responses/login_response.dart';
import 'package:flutter_template/data/services/api/api_service.dart';

class ApiServiceImpl implements ApiService {
  // Definicao da baseUrl
  final String baseUrl = "";

  @override
  // Funcao de login
  Future<LoginResponse?> login(String email, String password) async {
    // Classe de request
    var loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    // Cria JSON
    var json = jsonEncode(loginRequest);

    LoginResponse loginResponse = LoginResponse();

    try {
      // Classe de response
      http.Response response = await http.post(
        Uri.parse('$baseUrl/Auth/login'),
        headers: {'Content-Type': 'application/json', 'Accept': '*/*'},
        body: json,
      );

      if (response.statusCode == 200) {
        var message = response.body.toString();
        loginResponse = LoginResponse.fromJson(jsonDecode(message));
        return loginResponse;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
