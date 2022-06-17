import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/business/provider/cart_state.dart';
import 'package:state_management/data/service/product_service.dart';
import 'package:state_management/ui/cart_page.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({
    Key? key,
    required String title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ProductService().getAllProducts();
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const CartPage(),
              ),
            ),
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            var product = products[index];
            return ListTile(
              leading: Image.network(product.image),
              title: Text(product.name),
              subtitle: Text(product.description),
              onTap: () {
                CartStateNotifier cartProducts =
                    ref.read(cartStateProvider.state).state;
                cartProducts.addProductToCart(product: product);
              },
            );
          }),
    );
  }
}
