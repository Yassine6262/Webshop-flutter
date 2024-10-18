// lib/models/product.dart

class Product {
  final String id; // Unieke identificatie voor het product
  final String name;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.price,
  });
}
