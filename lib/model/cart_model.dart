import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ['Avocado', '100.00', 'lib/images/avocado.png', Colors.green],
    ['banana', '50.00', 'lib/images/banana.png', Colors.purple],
    ['Chicken', '600.00', 'lib/images/chicken.png', Colors.brown],
    ['Water', '20.00', 'lib/images/water.png', Colors.blue],
  ];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  final List _cartItems = [];

  void addToCart(int index) {
    _cartItems.add(_shopItems[index]);
    debugPrint('ITEM: ${_cartItems.length}');
    notifyListeners();
  }
  // Do it here

  void removeFromCart(int index) {
    _cartItems.removeAt(_shopItems[index]);
    notifyListeners();
  }

  String calculatePrice() {
    double totalPrice = 0.0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
      notifyListeners();
    }
    return totalPrice.toStringAsFixed(2);
  }
}
