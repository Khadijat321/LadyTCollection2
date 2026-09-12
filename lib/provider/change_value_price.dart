import 'package:flutter/material.dart';

class ChangeValuePrice extends ChangeNotifier {
  double _valuePrice = 0.0;

  double get valuePrice => _valuePrice;

  void setValuePrice(double newValue) {
    _valuePrice = newValue;
    notifyListeners();
  }
}