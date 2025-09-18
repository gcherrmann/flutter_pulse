import 'package:flutter_template/data/model/responses/login_response.dart';

abstract class ApiService {
  // Funcao de login
  Future<LoginResponse?> login(String email, String password);
}
