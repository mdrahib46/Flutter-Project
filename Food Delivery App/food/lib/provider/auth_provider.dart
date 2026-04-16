import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isChecked = false;
  bool _isPassVisible = false;

  bool _isLoading = false;

  bool get isChecked => _isChecked;
  bool get isPassVisible => _isPassVisible;
  bool get isLoading => _isLoading;

  void toggleRemember(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPassVisible = !_isPassVisible;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2)); // fake API

    _isLoading = false;
    notifyListeners();
  }
}
