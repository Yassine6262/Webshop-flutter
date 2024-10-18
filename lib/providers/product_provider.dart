import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(name: 'Product 1', price: 19.99),
    Product(name: 'Product 2', price: 29.99),
    Product(name: 'Product 3', price: 9.99),
  ];

  List<Product> get products => _products;
}
