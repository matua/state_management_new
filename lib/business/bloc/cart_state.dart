import 'package:flutter/material.dart';

import '../../data/model/product.dart';

class CartState extends ChangeNotifier {
  List<Product> _products = List<Product>.empty(growable: true);

  List<Product> get products => _products;

  void addProduct(Product product) {
    if (products.contains(product)) {
      throw Exception("Product is already in the cart. Only one is allowed.");
    }
    _products = [product, ..._products];
    notifyListeners();
  }

  void removeProduct(Product product) {
    _products.removeWhere((element) => element == product);
    notifyListeners();
  }

  void cleanCart() {
    _products.clear();
    notifyListeners();
  }
}
