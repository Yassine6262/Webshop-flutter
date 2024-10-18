import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.length;

  void addToCart(Product product) {
    _items.add(CartItem(product: product));
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _items.removeWhere((item) => item.product == product);
    notifyListeners();
  }
}

class CartItem {
  final Product product;

  CartItem({required this.product});
}
