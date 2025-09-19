import 'package:flutter_template/ui/core/base/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  Future<void> login(String email, String password) async {
    setLoading(true);
    try {
      await Future.delayed(const Duration(seconds: 5));
    } finally {
      setLoading(false);
    }
  }
}
