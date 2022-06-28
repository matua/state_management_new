import 'dart:async';

import '../../data/model/product.dart';

class CartCubit {
  List<Product> _products = List<Product>.empty(growable: true);

  final _stateController = StreamController<List<Product>>();

  Stream<List<Product>> get state => _stateController.stream;

  void addProduct({required Product product}) {
    try {
      if (_products.contains(product)) {
        throw Exception("Product is already in the cart. Only one is allowed.");
      }
      _products = [product, ..._products];
      _stateController.add(_products);
    } catch (e) {
      _stateController.addError(e);
    }
  }

  void removeProduct({required Product product}) {
    _products.removeWhere((element) => element == product);
    _stateController.add(_products);
  }

  void clearCart() {
    _products.clear();
    _stateController.add(_products);
  }

  void dispose() {
    _stateController.close();
  }
}
