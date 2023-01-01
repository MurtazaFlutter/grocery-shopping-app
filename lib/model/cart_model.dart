import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ['Avocado', '100.00', 'lib/images/avocado.png', Colors.green],
    ['Banana', '50.00', 'lib/images/banana.png', Colors.purple],
    ['Chicken', '600.00', 'lib/images/chicken.png', Colors.brown],
    ['Water', '20.00', 'lib/images/water.png', Colors.blue],
  ];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  get totalPrice => _totalPrice;

  final List _cartItems = [];

  String _totalPrice = '0';

  void addToCart(int index) {
    _cartItems.add(_shopItems[index]);
    calculatePrice();
    debugPrint('ITEM: ${_cartItems.length}');
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    calculatePrice();
    notifyListeners();
  }

  void calculatePrice() {
    double price = 0.0;
    for (int i = 0; i < _cartItems.length; i++) {
      price += double.parse(_cartItems[i][1]);
    }
    _totalPrice = price.toStringAsFixed(2);
    notifyListeners();
  }
}
