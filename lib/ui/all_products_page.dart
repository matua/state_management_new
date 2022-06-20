import 'package:flutter/material.dart';
import 'package:state_management/business/bloc/cart_state_block.dart';
import 'package:state_management/data/service/product_service.dart';
import 'package:state_management/ui/cart_page.dart';

import '../main.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({
    Key? key,
    required String title,
  }) : super(key: key);

  @override
  State<ProductsPage> createState() => ProductsPageState();
}

class ProductsPageState extends State<ProductsPage> {
  // late final CartBloc bloc;

  @override
  Widget build(BuildContext context) {
    final products = ProductService().getAllProducts();
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
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
                        getIt<CartBloc>().addProduct(product: product);
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

  @override
  void dispose() {
    getIt<CartBloc>().dispose();
    super.dispose();
  }
}
