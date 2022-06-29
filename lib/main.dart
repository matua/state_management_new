import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:state_management/business/state/cart_state.dart';

import 'cart_app.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<CartState>(CartState(), signalsReady: true);
  runApp(const CartApp());
}
