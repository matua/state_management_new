import 'package:mobx/mobx.dart';

import '../../data/model/product.dart';

part 'cart_state.g.dart';

class CartState = _CartState with _$CartState;

abstract class _CartState with Store {
  @observable
  List<Product> products = [];

  @action
  addProduct(Product product) {
    products = [product, ...products];
  }

  @action
  removeProduct(Product product) {
    products.removeWhere((p) => p == product);
  }
}
