import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/business/bloc/cart_bloc.dart';
import 'package:state_management/ui/products_page.dart';

class CartApp extends StatelessWidget {
  const CartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple State Management - Provider',
      home: BlocProvider<CartBloc>(
          create: (BuildContext context) => CartBloc(),
          child: const ProductsPage(title: 'Products')),
    );
  }
}
