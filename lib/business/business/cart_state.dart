import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/product.dart';
import 'products_state.dart';

class CartState extends StateNotifier<ProductsState> {
  CartState()
      : super(ProductsState(products: List<Product>.empty(growable: true)));

  void addProduct(Product product) {
    if (!state.products.contains(product)) {
      List<Product> products = [];
      products.addAll(state.products);
      products = [product, ...products];
      final newState = state.copyWith(products: products);
      state = newState;
    } else {
      throw Exception("Product is already in the cart. Only one is allowed.");
    }
  }

  void removeProduct(Product product) {
    List<Product> products = [];
    products.addAll(state.products);
    products.removeWhere((element) => element == product);
    final newState = state.copyWith(products: products);
    state = newState;
  }

  void cleanCart() {
    final newState = state.copyWith(products: []);
    state = newState;
  }
}
