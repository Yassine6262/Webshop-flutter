// lib/providers/cart_provider.dart

import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  int get cartItemCount => _cartItems.length;
}
