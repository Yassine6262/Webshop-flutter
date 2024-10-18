// lib/providers/product_provider.dart

import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [
    Product(id: '1', name: 'Product 1', price: 19.99),
    Product(id: '2', name: 'Product 2', price: 29.99),
    Product(id: '3', name: 'Product 3', price: 39.99),
  ];

  List<Product> get products => _products;

  void addProduct(String name, double price) {
    final newProduct = Product(id: DateTime.now().toString(), name: name, price: price);
    _products.add(newProduct);
    notifyListeners();
  }

  void updateProduct(String id, String name, double price) {
    final index = _products.indexWhere((product) => product.id == id);
    if (index >= 0) {
      _products[index] = Product(id: id, name: name, price: price);
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    _products.removeWhere((product) => product.id == id);
    notifyListeners();
  }
}
