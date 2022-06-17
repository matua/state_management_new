import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/business/provider/cart_state.dart';
import 'package:state_management/data/service/product_service.dart';
import 'package:state_management/ui/cart_page.dart';

import '../data/model/product.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({
    Key? key,
    required String title,
  }) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final productService = ProductService();

  @override
  Widget build(BuildContext context) {
    List<Product> products = productService.getAllProducts();
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
              onTap: () => {
                Provider.of<CartState>(context, listen: false)
                    .addProductToCart(product: product)
              },
            );
          }),
    );
  }
}
