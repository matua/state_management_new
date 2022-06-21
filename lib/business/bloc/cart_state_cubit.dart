import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/product.dart';

class CartBloc extends Cubit<List<Product>> {
  CartBloc() : super(List<Product>.empty(growable: true));
  List<Product> _products = List<Product>.empty(growable: true);

  Stream<List<Product>> addProduct({required Product product}) async* {
    _products = [product, ..._products];
    yield _products;
  }

  Stream<List<Product>> removeProduct({required Product product}) async* {
    _products.removeWhere((element) => element == product);
    yield _products;
  }
}
