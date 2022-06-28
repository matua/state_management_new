import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'business/bloc/cart_cubit.dart';
import 'cart_app.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<CartCubit>(CartCubit(), signalsReady: true);
  runApp(const CartApp());
}
