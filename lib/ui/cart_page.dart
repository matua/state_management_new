import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_management/business/state/cart_state.dart';

import '../data/model/product.dart';
import '../main.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = getIt<CartState>();

    return Observer(
      builder: (context) => ListView.builder(
          itemCount: state.products.length,
          itemBuilder: (BuildContext context, int index) {
            final Product product = state.products[index];
            return Dismissible(
              key: Key(product.id.toString()),
              onDismissed: (direction) {
                state.removeProduct(product);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: const Duration(milliseconds: 300),
                    content: Text('${product.description} removed')));
              },
              child: ListTile(
                leading: Image.network(product.image),
                title: Text(product.name),
                subtitle: Text(product.description),
              ),
            );
          }),
    );
  }
}
