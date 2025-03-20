import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelpers {
  static SharedPreferences? prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setBoolean({
    required String key,
    required bool value,
  }) async {
    return await prefs!.setBool(key, value);
  }

  static bool? getBoolean({
    required String key,
  }) {
    return prefs!.getBool(key);
  }

  static int? getint({
    required String key,
  }) {
    return prefs!.getInt(key);
  }

  static String? getString({
    required String key,
  }) {
    return prefs!.getString(key);
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) return await prefs!.setString(key, value);
    if (value is int) return await prefs!.setInt(key, value);

    if (value is bool) return await prefs!.setBool(key, value);
    if (value is List) {
      return await prefs!.setStringList(key, value as List<String>);
    }
    return await prefs!.setString(key, value);
  }

  static dynamic getData({required String key}) async {
    return prefs!.get(key);
  }

  static dynamic getListData({required String key}) async {
    return prefs!.getStringList(key);
  }

  static dynamic deleteData({required String key}) async {
    return prefs!.remove(key);
  }

  static Future<bool> hasKey(String key) async {
    return prefs!.containsKey(key);
  }

  static clear() async {
    return prefs!.clear();
  }
}
