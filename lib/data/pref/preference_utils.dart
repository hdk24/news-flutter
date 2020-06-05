import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {

  Future<void> saveBoolean(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future<bool> getBoolean(String key, [bool defValue = false]) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? defValue;
  }
}
