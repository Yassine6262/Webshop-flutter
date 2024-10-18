import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../models/product.dart';

class ProductManagerScreen extends StatelessWidget {
  const ProductManagerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Implement add product screen
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productProvider.products.length,
        itemBuilder: (ctx, i) => ListTile(
          title: Text(productProvider.products[i].title),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // TODO: Implement update product screen
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  productProvider.deleteProduct(productProvider.products[i].id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  