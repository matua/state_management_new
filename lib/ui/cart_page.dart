import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/business/bloc/cart_event.dart';
import 'package:state_management/business/bloc/cart_state_block.dart';

import '../data/model/product.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, List<Product>>(
      builder: (_, state) => ListView.builder(
          itemCount: state.length,
          itemBuilder: (BuildContext context, int index) {
            final Product product;
            product = state[index];
            return Dismissible(
              key: Key(product.id.toString()),
              onDismissed: (direction) {
                context
                    .read<CartBloc>()
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
          }),
    );
  }
}
