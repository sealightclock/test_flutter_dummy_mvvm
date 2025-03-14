import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import '../model/my_string_model.dart';

class MyStringRepository {
  static const String _key = "my_string";

  Future<void> saveString(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, value);
  }

  Future<MyStringModel> getString() async {
    final prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(_key) ?? "Default Value";
    return MyStringModel(value);
  }

  Future<MyStringModel> fetchFromServer() async {
    await Future.delayed(Duration(seconds: 2)); // Simulating network delay
    String fetchedValue = "Server Value ${DateTime.now().millisecondsSinceEpoch}";
    return MyStringModel(fetchedValue);
  }
}
