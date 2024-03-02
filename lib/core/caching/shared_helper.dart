import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static SharedHelper? instance;
  late SharedPreferences preferences;

  SharedHelper._();

  static Future<void> init() async {
    instance ??= SharedHelper._();
    instance!.preferences = await SharedPreferences.getInstance();
  }

  void writeData(String key, dynamic value) {
    log("Saving => $value, with key $key");
    if (value is String) {
      preferences.setString(key, value);
    } else if (value is int) {
      preferences.setInt(key, value);
    } else if (value is bool) {
      preferences.setBool(key, value);
    } else if (value is double) {
      preferences.setDouble(key, value);
    }
  }

  bool readBoolean(String key) {
    return preferences.getBool(key) ?? false;
  }

  double readDouble(String key) {
    return preferences.getDouble(key) ?? 0.0;
  }

  int readInteger(String key) {
    return preferences.getInt(key) ?? 0;
  }

  String readString(String key) {
    return preferences.getString(key) ?? "";
  }

  void clear() {
    preferences.clear();
  }

  void removeData(String key) {
    preferences.remove(key);
  }
}
