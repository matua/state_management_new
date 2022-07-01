import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../business/business/providers.dart';
import '../data/model/product.dart';

class CartPage extends ConsumerWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(cartStateProvider);
    final List<Product> cartProducts = productsState.products;

    return cartProducts.isEmpty
        ? const EmptyCartWidget()
        : ListView.builder(
            itemCount: cartProducts.length,
            itemBuilder: (BuildContext context, int index) {
              final Product product;
              product = cartProducts[index];
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  ref.read(cartStateProvider.notifier).removeProduct(product);

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
