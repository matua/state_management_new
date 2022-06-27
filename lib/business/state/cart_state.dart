import 'package:flutter/material.dart';
import 'package:state_management/business/state/cart_actions.dart';

import '../../data/model/product.dart';

@immutable
class CartState {
  final List<Product> products;

  const CartState({this.products = const []});

  CartState copyWith({
    List<Product>? products,
  }) {
    return CartState(products: products ?? this.products);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartState &&
          runtimeType == other.runtimeType &&
          products == other.products;

  @override
  int get hashCode => products.hashCode;

  CartState.initialState() : products = List<Product>.empty(growable: true);
}

CartState reducer(CartState previousState, dynamic action) {
  if (action is AddProductAction) {
    CartState copy = previousState.copyWith(products: previousState.products);
    if (!copy.products.contains(action.product)) {
      copy.products.add(action.product);
    } else {
      throw Exception("Product is already in the cart. Only one is allowed.");
    }
    return copy;
  }
  if (action is RemoveProductAction) {
    CartState copy = previousState.copyWith(products: previousState.products);
    copy.products.removeWhere((element) => element == action.product);
    return copy;
  }

  if (action is CleanCartAction) {
    CartState copy = previousState.copyWith(products: previousState.products);
    copy.products.clear();
    return copy;
  }
  return previousState;
}
