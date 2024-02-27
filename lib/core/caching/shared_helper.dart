import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import 'caching_key.dart';

class SharedHelper {
  static SharedHelper? instance;
  late SharedPreferences preferences;

  SharedHelper._();

  factory SharedHelper() {
    instance ??= SharedHelper._();
    return instance!;
  }

  static Future<void> init() async {
    instance!.preferences = await SharedPreferences.getInstance();
  }

  void writeData(CachingKey key, dynamic value) {
    log("Saving => $value, with key ${key.value}");
    if (value is String) {
      preferences.setString(key.value, value);
    } else if (value is int) {
      preferences.setInt(key.value, value);
    } else if (value is bool) {
      preferences.setBool(key.value, value);
    } else if (value is double) {
      preferences.setDouble(key.value, value);
    }
  }

  bool readBoolean(CachingKey key) {
    return preferences.getBool(key.value) ?? false;
  }

  double readDouble(CachingKey key) {
    return preferences.getDouble(key.value) ?? 0.0;
  }

  int readInteger(CachingKey key) {
    return preferences.getInt(key.value) ?? 0;
  }

  String readString(CachingKey key) {
    return preferences.getString(key.value) ?? "";
  }

  void clear() {
    preferences.clear();
  }

  void removeData(CachingKey key) {
    preferences.remove(key.value);
  }
}
