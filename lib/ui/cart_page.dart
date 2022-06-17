import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../business/provider/cart_state.dart';
import '../data/model/product.dart';

class CartPage extends ConsumerWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Product> products = ref.watch(cartStateProvider).state;
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            var product = products[index];
            return ListTile(
              leading: Image.network(product.image),
              title: Text(product.name),
              subtitle: Text(product.description),
            );
          }),
    );
  }
}
