// lib/screens/product_manager_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../models/product.dart';

class ProductManagerScreen extends StatelessWidget {
  const ProductManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Beheer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _showProductDialog(context, productProvider);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productProvider.products.length,
        itemBuilder: (context, index) {
          final product = productProvider.products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('€${product.price.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _showProductDialog(context, productProvider, product: product);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    productProvider.deleteProduct(product.id);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showProductDialog(BuildContext context, ProductProvider productProvider, {Product? product}) {
    final nameController = TextEditingController(text: product?.name);
    final priceController = TextEditingController(text: product?.price.toString());
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(product == null ? 'Voeg Product Toe' : 'Bewerk Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Productnaam'),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Prijs'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (product == null) {
                  productProvider.addProduct(nameController.text, double.parse(priceController.text));
                } else {
                  productProvider.updateProduct(product.id, nameController.text, double.parse(priceController.text));
                }
                Navigator.of(context).pop();
              },
              child: Text(product == null ? 'Toevoegen' : 'Bijwerken'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Annuleren'),
            ),
          ],
        );
      },
    );
  }
}
