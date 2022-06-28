import 'package:flutter/material.dart';

import '../business/bloc/cart_cubit.dart';
import '../data/model/product.dart';
import '../main.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Product>>(
        stream: getIt<CartCubit>().state,
        builder: (_, snapshot) {
          if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(45.0),
              child: Center(
                  child: Text(
                      style: const TextStyle(fontSize: 30),
                      snapshot.error.toString())),
            );
          } else if (snapshot.hasData) {
            int? itemCount;
            List<Product>? products;
            itemCount = snapshot.data?.length;
            if (itemCount == 0) {
              return const EmptyCartWidget();
            }
            products = snapshot.data;
            return ListView.builder(
                itemCount: itemCount,
                itemBuilder: (BuildContext context, int index) {
                  final Product product;
                  product = products![index];
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      getIt<CartCubit>().removeProduct(product: product);
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
          } else {
            return const EmptyCartWidget();
          }
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