import 'package:flutter/material.dart';

class HealthProvider with ChangeNotifier {
  // 0 = Brain, 1 = Heart, 2 = Lungs
  int _selectedIndex = 0;

  // Stress Level State (0 to 100)
  double _stressLevel = 65.0;

  int get selectedIndex => _selectedIndex;
  double get stressLevel => _stressLevel;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void updateStressLevel(double value) {
    _stressLevel = value.clamp(0.0, 100.0);
    notifyListeners();
  }

  void incrementStress() {
    if (_stressLevel < 100) {
      _stressLevel += 5;
      notifyListeners();
    }
  }

  void decrementStress() {
    if (_stressLevel > 0) {
      _stressLevel -= 5;
      notifyListeners();
    }
  }
}
