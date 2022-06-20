import 'package:flutter/material.dart';
import 'package:state_management/business/bloc/cart_event.dart';
import 'package:state_management/business/bloc/cart_state_block.dart';

import '../data/model/product.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key, required this.bloc}) : super(key: key);
  final CartBloc bloc;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Product>>(
        stream: widget.bloc.state,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            int? itemCount;
            List<Product>? products;
            itemCount = snapshot.data?.length;
            if (itemCount == 0) {
              return const Center(child: Text('No items in the cart yet'));
            }
            products = snapshot.data;
            return ListView.builder(
                itemCount: itemCount,
                itemBuilder: (BuildContext context, int index) {
                  final Product product;
                  product = products![index];
                  return Dismissible(
                    key: Key(product.id.toString()),
                    onDismissed: (direction) {
                      widget.bloc.action
                          .add(RemoveProductEvent(product: product));
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
            return const Center(child: Text('No items in the cart yet'));
          }
        });
  }
}
