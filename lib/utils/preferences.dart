import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  late final SharedPreferences sharedPrefs;

  static final Preferences _instance = Preferences._internal();
  factory Preferences() => _instance;
  Preferences._internal();

  Future<void> init() async {
    sharedPrefs = await SharedPreferences.getInstance();
  }
}
