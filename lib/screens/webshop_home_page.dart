// lib/screens/webshop_home_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../screens/product_manager_screen.dart';

class WebshopHomePage extends StatefulWidget {
  const WebshopHomePage({super.key});

  @override
  State<WebshopHomePage> createState() => _WebshopHomePageState();
}

class _WebshopHomePageState extends State<WebshopHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Webshop'),
        actions: [
          IconButton(
            icon: const Icon(Icons.admin_panel_settings),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProductManagerScreen()));
            },
          ),
        ],
      ),
      body: Center(
        child: const Text('Welkom bij de webshop!'),
      ),
    );
  }
}
