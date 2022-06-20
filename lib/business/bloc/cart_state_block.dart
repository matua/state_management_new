import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/product.dart';
import 'cart_event.dart';

class CartBloc extends Bloc<CartEvent, List<Product>> {
  CartBloc() : super([]);
  List<Product> _products = List<Product>.empty(growable: true);

  @override
  mapEventToState(CartEvent event) async* {
    if (event is AddProductEvent) {
      _products = [event.product, ..._products];
    } else if (event is RemoveProductEvent) {
      _products.removeWhere((element) => element == event.product);
    }
    yield _products;
  }
}
