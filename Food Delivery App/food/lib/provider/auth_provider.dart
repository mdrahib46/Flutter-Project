import 'dart:async';

import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isChecked = false;
  bool _isPassVisible = false;
  bool _isConfirmPassVisible = false;
  bool _isLoading = false;
  int _resedOtpTime = 10;
  Timer? _timer;

  int get getResendOtpTime => _resedOtpTime;
  bool get isConfirmPassVisible => _isConfirmPassVisible;
  bool get isChecked => _isChecked;
  bool get isPassVisible => _isPassVisible;
  bool get isLoading => _isLoading;


  void resendOtp(){
    _timer?.cancel();
    _resedOtpTime = 10;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer){
      if(_resedOtpTime > 0){
        _resedOtpTime --;
        notifyListeners();
      }else{
        _timer?.cancel();
      }
    });
    notifyListeners();
  }

  void toggleRemember(bool value) {
    _isChecked = value;
    notifyListeners();
  }


  void toggleConfirmPasswordVisibility() {
    _isConfirmPassVisible = !_isConfirmPassVisible;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPassVisible = !_isPassVisible;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();
  }
}
