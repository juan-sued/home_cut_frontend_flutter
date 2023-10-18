import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> get _instance async =>
      _prefs ??= await SharedPreferences.getInstance();

  static Future<bool?> getPref(String key) async {
    final SharedPreferences prefs = await _instance;
    return prefs.getBool(key);
  }

  static Future<void> setPref(String key, bool value) async {
    final SharedPreferences prefs = await _instance;
    await prefs.setBool(key, value);
  }
}
