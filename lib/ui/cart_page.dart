import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../business/bloc/cart_state.dart';
import '../data/model/product.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    List<Product> cartProducts = context.watch<CartState>().products;
    return cartProducts.isEmpty
        ? const EmptyCartWidget()
        : ListView.builder(
            itemCount: cartProducts.length,
            itemBuilder: (BuildContext context, int index) {
              final Product product;
              product = cartProducts[index];
              return Dismissible(
                key: Key(product.id.toString()),
                onDismissed: (direction) {
                  context.read<CartState>().removeProduct(product);
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
            });
  }
}

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child:
            Text(style: TextStyle(fontSize: 30), 'No items in the cart yet'));
  }
}