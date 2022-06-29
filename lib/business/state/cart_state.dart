import 'package:mobx/mobx.dart';

import '../../data/model/product.dart';

part 'cart_state.g.dart';

class CartState = _CartState with _$CartState;

abstract class _CartState with Store {
  @observable
  List<Product> products = [];

  @action
  addProduct(Product product) {
    if (!products.contains(product)) {
      products = [product, ...products];
    } else {
      throw Exception("Product is already in the cart. Only one is allowed.");
    }
  }

  @action
  removeProduct(Product product) {
    products.removeWhere((p) => p == product);
  }

  @action
  clearCart() {
    products = [];
  }
}
