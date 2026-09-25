import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
class ChangeValuePrice extends ChangeNotifier {
  List<Map<String, dynamic>> _products = [
    {'name': 'Laptop', 'quantity': 0, 'price': 300000},
    {'name': 'Phone', 'quantity': 0, 'price': 200000},
    {'name': 'Tv', 'quantity': 0, 'price': 500000},
  ];

List<Map<String, dynamic>> get products => _products;

 int get totalItem {
    int total = 0;
    for (var product in products) {
      total += product['quantity'] as int;
    }

    return total;
  }

  int get totalPrice {
    int total = 0;
    for (var product in products) {
      total += product['price'] * product['quantity'] as int;
    }

    return total;
  }

  void addToCart(int index) {
    
    products[index]['quantity'] = (product[index]['quantity'] as int ) + 1 ;
    notifyListeners();
  }

  void removeFromCart(int index) {
    if (products[index]['quantity'] > 0) {
      products[index]['quantity'] = (product[index]['quantity'] as int ) - 1 ;
  
    }
      notifyListeners();
  }

 

  void clearCart() {
    for (var product in products) {
      
        product['quantity'] = 0;
      
    }
    notifyListeners();
  }
}