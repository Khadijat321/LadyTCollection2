import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
class ChangeValuePrice extends ChangeNotifier {
  double _valuePrice = 0.0;

  double get valuePrice => _valuePrice;

  int price = 30000;

  void setValuePrice(double newValue) {
    _valuePrice = newValue;
    notifyListeners();
  }
  void setLaptopPrice ( int quantity ){
      price = price * quantity;
      notifyListeners();
  }
}