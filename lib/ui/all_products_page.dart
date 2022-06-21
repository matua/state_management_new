import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/data/service/product_service.dart';
import 'package:state_management/ui/cart_page.dart';

import '../business/bloc/cart_state_cubit.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({
    Key? key,
    required String title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = ProductService().getAllProducts();
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<CartBloc>(
        create: (_) => CartBloc(),
        child: Column(
          children: [
            SizedBox(
              height: height / 2,
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    var product = products[index];
                    return ListTile(
                      leading: Image.network(product.image),
                      title: Text(product.name),
                      subtitle: Text(product.description),
                      onTap: () =>
                          context.read<CartBloc>().addProduct(product: product),
                    );
                  }),
            ),
            const Text(
              'Cart',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 200,
              child: CartPage(),
            ),
          ],
        ),
      ),
    );
  }
}
