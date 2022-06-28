import 'package:flutter/material.dart';
import 'package:state_management/ui/products_page.dart';

class CartApp extends StatelessWidget {
  const CartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple State Management - Provider',
      home: ProductsPage(title: 'Products'),
    );
  }
}
