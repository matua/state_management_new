import 'package:flutter/material.dart';

import '../../data/model/product.dart';

class CartState extends ChangeNotifier {
  List<Product> _products = List<Product>.empty(growable: true);

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products = [product, ..._products];
    notifyListeners();
  }

  void removeProduct(Product product) {
    _products.removeWhere((element) => element == product);
    notifyListeners();
  }
}
