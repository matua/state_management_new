import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'business/state/cart_store.dart';
import 'ui/all_products_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Simple State Management - Provider',
      home: ProductsPage(title: 'Products'),
    );
  }
}
