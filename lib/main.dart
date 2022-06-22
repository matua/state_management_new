import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:state_management/business/state/cart_state.dart';

import 'ui/all_products_page.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<CartState>(CartState(), signalsReady: true);
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
