import 'package:flutter/material.dart';
import 'package:flutter_template/ui/core/base/base_view_model.dart';
import 'package:flutter_template/ui/core/ui/loader.dart';

class LoginViewModel extends BaseViewModel {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners(); // Atualiza a UI
  }

  Future<void> login(String email, String password) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(seconds: 2)); // simula API
      // Aqui entraria a lógica real de login
    } finally {
      _setLoading(false);
    }
  }

  void showLoader(BuildContext context) {
    Loader.showOverlay(context);
  }

  void hideLoader() {
    Loader.removeOverlay();
  }
}
