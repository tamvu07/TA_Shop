import 'package:flutter/foundation.dart';

class GenderProvider with ChangeNotifier {
  bool _isBoyChecked = true;
  bool _isGirlChecked = false;

  bool get isBoyChecked => _isBoyChecked;
  bool get isGirlChecked => _isGirlChecked;

  void toggleBoy(bool value) {
    _isBoyChecked = value;
    if (_isBoyChecked) {
      _isGirlChecked = false;
    }
    notifyListeners();
  }

  void toggleGirl(bool value) {
    _isGirlChecked = value;
    if (_isGirlChecked) {
      _isBoyChecked = false;
    }
    notifyListeners();
  }
}