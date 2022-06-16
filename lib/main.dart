import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/business/provider/cart_state.dart';

import 'ui/all_products_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartState>(
      create: (BuildContext context) => CartState(),
      child: const MaterialApp(
        title: 'Simple State Management - Provider',
        home: ProductsPage(title: 'Products'),
      ),
    );
  }
}
