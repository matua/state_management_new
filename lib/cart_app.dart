import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_management/ui/products_page.dart';

import 'business/state/cart_state.dart';
import 'business/state/cart_store.dart';

class CartApp extends StatelessWidget {
  const CartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CartState>(
      store: store,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Simple State Management - Provider',
        home: ProductsPage(title: 'Products'),
      ),
    );
  }
}
