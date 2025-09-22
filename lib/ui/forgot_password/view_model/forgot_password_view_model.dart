import 'package:flutter_template/ui/core/base/base_view_model.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  Future<void> sendRecoveryEmail(String email) async {
    setLoading(true);
    try {
      await Future.delayed(const Duration(seconds: 5));
    } finally {
      setLoading(false);
    }
  }
}
