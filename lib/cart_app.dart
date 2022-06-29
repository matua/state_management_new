import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/business/bloc/cart_state_cubit.dart';
import 'package:state_management/ui/products_page.dart';

class CartApp extends StatelessWidget {
  const CartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple State Management - Provider',
      home: BlocProvider<CartCubit>(
          create: (BuildContext context) => CartCubit(),
          child: const ProductsPage(title: 'Products')),
    );
  }
}
