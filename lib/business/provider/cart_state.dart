import 'package:flutter/material.dart';

import '../../data/model/product.dart';

class CartState extends ChangeNotifier {
  final List<Product> products = [];

  void addProductToCart({required Product product}) {
    products.add(product);
    notifyListeners();
  }
}
