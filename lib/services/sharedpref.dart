import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {
  Future<Map<String, dynamic>> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return jsonDecode(prefs.getString(key));
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  logInUser(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('login', token);
  }

  clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
