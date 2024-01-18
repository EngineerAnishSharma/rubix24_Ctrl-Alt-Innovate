import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LocalStorage {
  static SharedPreferences? _preferences;
  static const String _keyPrefix = 'your_app_prefix_'; // Add your app prefix

  static Future<void> _init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  static Future<void> setString(String key, String value) async {
    await _init();
    await _preferences!.setString(_keyPrefix + key, value);
  }

  static Future<String> getString(String key, String defaultValue) async {
    await _init();
    return _preferences!.getString(_keyPrefix + key) ?? defaultValue;
  }

  static Future<void> setInt(String key, int value) async {
    await _init();
    await _preferences!.setInt(_keyPrefix + key, value);
  }

  static Future<int> getInt(String key, int defaultValue) async {
    await _init();
    return _preferences!.getInt(_keyPrefix + key) ?? defaultValue;
  }

  static Future<void> setDouble(String key, double value) async {
    await _init();
    await _preferences!.setDouble(_keyPrefix + key, value);
  }

  static Future<double> getDouble(String key, double defaultValue) async {
    await _init();
    return _preferences!.getDouble(_keyPrefix + key) ?? defaultValue;
  }

  static Future<void> setBool(String key, bool value) async {
    await _init();
    await _preferences!.setBool(_keyPrefix + key, value);
  }

  static Future<bool> getBool(String key, bool defaultValue) async {
    await _init();
    return _preferences!.getBool(_keyPrefix + key) ?? defaultValue;
  }

  static Future<void> remove(String key) async {
    await _init();
    await _preferences!.remove(_keyPrefix + key);
  }

  static Future<void> clear() async {
    await _init();
    await _preferences!.clear();
  }

  // New methods for Map and List

  static Future<void> setMap(String key, Map<String, dynamic> value) async {
    await _init();
    await _preferences!.setString(_keyPrefix + key, json.encode(value));
  }

  static Future<Map<String, dynamic>> getMap(String key, Map<String, dynamic> defaultValue) async {
    await _init();
    final jsonString = _preferences!.getString(_keyPrefix + key);
    return jsonString != null ? json.decode(jsonString) : defaultValue;
  }

  static Future<void> setList(String key, List<dynamic> value) async {
    await _init();
    await _preferences!.setString(_keyPrefix + key, json.encode(value));
  }

  static Future<List<dynamic>> getList(String key, List<dynamic> defaultValue) async {
    await _init();
    final jsonString = _preferences!.getString(_keyPrefix + key);
    return jsonString != null ? json.decode(jsonString) : defaultValue;
  }
}
