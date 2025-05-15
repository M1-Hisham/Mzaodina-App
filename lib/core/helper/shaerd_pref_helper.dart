import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Shared pref helper class to store and retrieve data from shared preferences.
class SharedPrefHelper {
  // private constructor as I don't want to allow creating an instance of this class itself.
  SharedPrefHelper._();

  /// Removes a value from SharedPreferences with given [key].
  static removeData(String key) async {
    log('SharedPrefHelper : data with key : $key has been removed');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static clearAllData() async {
    log('SharedPrefHelper : all data has been cleared');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static setData(String key, value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    log("SharedPrefHelper : setData with key : $key and value : $value");
    switch (value.runtimeType) {
      case const (String):
        await sharedPreferences.setString(key, value);
        break;
      case const (int):
        await sharedPreferences.setInt(key, value);
        break;
      case const (bool):
        await sharedPreferences.setBool(key, value);
        break;
      case const (double):
        await sharedPreferences.setDouble(key, value);
        break;
      default:
        return null;
    }
  }

  /// Clears the user data from SharedPreferences.
  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("user_data");
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static getBool(String key) async {
    log('SharedPrefHelper : getBool with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with given [key].
  static getDouble(String key) async {
    log('SharedPrefHelper : getDouble with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with given [key].
  static getInt(String key) async {
    log('SharedPrefHelper : getInt with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }

  /// Gets an String value from SharedPreferences with given [key].
  static getString(String key) async {
    log('SharedPrefHelper : getString with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }

  /// Saves a [value] with a [key] in the FlutterSecureStorage.
  static setSecuredString(String key, String value) async {
    const flutterSecureStorage = FlutterSecureStorage();
    log(
      "FlutterSecureStorage : setSecuredString with key : $key and value : $value",
    );
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].
  static getSecuredString(String key) async {
    const flutterSecureStorage = FlutterSecureStorage();
    log('FlutterSecureStorage : getSecuredString with key :');
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  /// Removes all keys and values in the FlutterSecureStorage
  static clearAllSecuredData() async {
    log('FlutterSecureStorage : all data has been cleared');
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }
}
