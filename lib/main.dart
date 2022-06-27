import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'business/bloc/cart_bloc.dart';
import 'cart_app.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<CartBloc>(CartBloc(), signalsReady: true);
  runApp(const CartApp());
}
