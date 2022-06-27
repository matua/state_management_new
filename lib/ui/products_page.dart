import 'package:flutter/material.dart';
import 'package:state_management/business/state/cart_actions.dart';
import 'package:state_management/data/service/product_service.dart';
import 'package:state_management/ui/cart_page.dart';

import '../business/state/cart_store.dart';

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
      appBar: AppBar(actions: [
        GestureDetector(
            onTap: () => store.dispatch(CleanCartAction()),
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
                      onTap: () {
                        try {
                          store.dispatch(AddProductAction(product: product));
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: const Duration(milliseconds: 1000),
                              content: Text(e.toString())));
                        }
                      });
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
    );
  }
}
