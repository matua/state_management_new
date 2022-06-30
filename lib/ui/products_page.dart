import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/business/bloc/cart_event.dart';
import 'package:state_management/business/bloc/products_state.dart';
import 'package:state_management/data/service/product_service.dart';
import 'package:state_management/ui/cart_page.dart';

import '../business/bloc/cart_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({
    Key? key,
    required String title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = ProductService().getAllProducts();
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder<CartBloc, ProductsState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(actions: [
          GestureDetector(
              onTap: () =>
                  BlocProvider.of<CartBloc>(context).add(CleanCartEvent()),
              child: const Icon(Icons.clear)),
        ]),
        body: Column(
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
                      onTap: () => BlocProvider.of<CartBloc>(context)
                          .add(AddProductEvent(product: product)),
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
                SizedBox(
              height: 200,
              child: state.products.isEmpty
                  ? const EmptyCartWidget()
                  : const CartPage(),
            ),
          ],
        ),
      ),
    );
  }
}
