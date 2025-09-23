import 'package:flutter_template/ui/core/base/base_view_model.dart';

class TermsOfUseViewModel extends BaseViewModel {
  bool _isChecked = false;
  bool get isChecked => _isChecked;

  void setCheckboxValue(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  Future<void> acceptTerms() async {
    setLoading(true);
    try {
      await Future.delayed(const Duration(seconds: 5));
    } finally {
      setLoading(false);
    }
  }
}
