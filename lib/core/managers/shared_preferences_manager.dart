import 'package:shared_preferences/shared_preferences.dart';

const String _key = "key";

class SharedPreferencesManager {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // onBoarding is Showen before
  static Future<void> setkey(bool val) async {
    await _prefs.setBool(_key, val);
  }

  static bool getkey() {
    return _prefs.getBool(_key) ?? false;
  }

  static Future<bool> removekey() async {
    return await _prefs.remove(_key);
  }
}
