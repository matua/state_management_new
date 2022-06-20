import 'dart:async';

import '../../data/model/product.dart';

class CartBloc {
  List<Product> _products = List<Product>.empty(growable: true);

  final _stateController = StreamController<List<Product>>();

  Stream<List<Product>> get state => _stateController.stream;

  void addProduct({required Product product}) {
    _products = [product, ..._products];
    _stateController.add(_products);
  }

  void removeProduct({required Product product}) {
    _products.removeWhere((element) => element == product);
    _stateController.add(_products);
  }

  void dispose() {
    _stateController.close();
  }
}
