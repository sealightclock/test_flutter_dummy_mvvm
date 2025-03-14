import 'package:flutter/material.dart';
import '../model/my_string_model.dart';
import '../core/my_string_repository.dart';

class MyStringViewModel extends ChangeNotifier {
  final MyStringRepository _repository = MyStringRepository();
  MyStringModel _myString = MyStringModel("Loading...");

  MyStringModel get myString => _myString;

  MyStringViewModel() {
    loadString();
  }

  Future<void> loadString() async {
    _myString = await _repository.getString();
    notifyListeners();
  }

  Future<void> updateString(String newValue) async {
    _myString = MyStringModel(newValue);
    await _repository.saveString(newValue);
    notifyListeners();
  }

  Future<void> fetchFromServer() async {
    _myString = await _repository.fetchFromServer();
    await _repository.saveString(_myString.value); // Persist fetched value
    notifyListeners();
  }
}
