import 'dart:async';

import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  Timer? _timer;
  final int totalPage = 3;

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void startAutoSlide(PageController controller) {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentIndex < totalPage - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }

      controller.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );

      notifyListeners();
    });
  }

  void stopAutoSlide() {
    _timer?.cancel();
    _timer = null;
  }

  void nextPage(PageController controller) {
    if (_currentIndex < totalPage - 1) {
      _currentIndex++;
      controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }

  void skip(PageController controller) {
    _currentIndex = totalPage - 1;
    controller.jumpToPage(_currentIndex);
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
