import 'package:flutter/material.dart';
import 'models/order.dart';
import 'screens/order_history_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webshop',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: OrderHistoryScreen(
        orders: [
          Order(id: '1', product: 'Product A', date: DateTime.now()),
          Order(id: '2', product: 'Product B', date: DateTime.now().subtract(Duration(days: 1))),
        ],
      ),
    );
  }
}
