import 'package:flutter/material.dart';
import 'package:state_management/business/state/cart_actions.dart';

import '../../data/model/product.dart';

@immutable
class CartState {
  final List<Product> _products;

  const CartState(this._products);

  List<Product> get products => _products;

  CartState.initialState() : _products = List<Product>.empty(growable: true);
}

CartState reducer(CartState previousState, dynamic action) {
  if (action is AddProductAction) {
    previousState.products.add(action.product);
    return CartState(previousState.products);
  }
  if (action is RemoveProductAction) {
    previousState.products.removeWhere((element) => element == action.product);
    return CartState(previousState.products);
  }
  return previousState;
}
