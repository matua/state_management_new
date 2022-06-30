import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/business/bloc/cart_event.dart';
import 'package:state_management/business/bloc/products_state.dart';

import '../business/bloc/cart_bloc.dart';
import '../data/model/product.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, ProductsState>(
      builder: (_, state) => Builder(builder: (context) {
        return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (BuildContext context, int index) {
              final Product product;
              product = state.products[index];
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  BlocProvider.of<CartBloc>(context)
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
      }),
    );
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
