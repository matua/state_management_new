import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_management/data/service/product_service.dart';
import 'package:state_management/ui/cart_page.dart';

import '../business/business/providers.dart';

class ProductsPage extends HookConsumerWidget {
  const ProductsPage({
    Key? key,
    required String title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ProductService().getAllProducts();
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(actions: [
        Builder(builder: (context) {
          return GestureDetector(
              // onTap: () => ref.invalidate(cartStateProvider)
              onTap: () => ref.read(cartStateProvider.notifier).cleanCart(),
              child: const Icon(Icons.clear));
        }),
      ]),
      body: SingleChildScrollView(
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
                        onTap: () {
                          try {
                            ref
                                .read(cartStateProvider.notifier)
                                .addProduct(product);
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
      ),
    );
  }
}
