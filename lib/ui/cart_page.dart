import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/business/provider/cart_state.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<CartState>(
        builder: (_, products, __) => ListView.builder(
            itemCount: products.products.length,
            itemBuilder: (BuildContext context, int index) {
              var product = products.products[index];
              return ListTile(
                leading: Image.network(product.image),
                title: Text(product.name),
                subtitle: Text(product.description),
              );
            }),
      ),
    );
  }
}
