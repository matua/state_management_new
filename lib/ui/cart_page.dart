import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_management/business/state/cart_actions.dart';
import 'package:state_management/business/state/cart_state.dart';

import '../data/model/product.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<CartState>(
      onInit: (store) => store.dispatch(CartState.initialState()),
      builder: (context, store) => ListView.builder(
          itemCount: store.state.products.length,
          itemBuilder: (BuildContext context, int index) {
            final Product product = store.state.products[index];
            return Dismissible(
              key: Key(product.id.toString()),
              onDismissed: (direction) {
                store.dispatch(RemoveProductAction(product: product));
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
