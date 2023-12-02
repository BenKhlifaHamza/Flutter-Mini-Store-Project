import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isAuth() async {
  String? userData = await getStoredString("user_data");
  if (userData != null && userData.isNotEmpty) {
    return true;
  }
  return false;
}

Future<bool> saveUserCredentials(Map data) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String jsonString = jsonEncode(data);
  prefs.setString("user_data", jsonString);
  return true;
}

Future<String?> getStoredString(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

Future<bool> clearUserCredentials(Map data) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  return true;
}

String? myValidator(String? val) {
  if (val == null || val.isEmpty) {
    return "This field is required.";
  }
  return null;
}

String? rePasswordValidator(String? pass1, String? pass2) {
  if (pass1 != pass2) {
    return "Passwords Must Be Match";
  }
  return null;
}
