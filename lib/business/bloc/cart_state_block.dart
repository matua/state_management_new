import 'dart:async';

import '../../data/model/product.dart';
import 'cart_event.dart';

class CartBloc {
  List<Product> _products = List<Product>.empty(growable: true);

  final _eventsController = StreamController<CartEvent>();
  final _stateController = StreamController<List<Product>>();

  Stream<List<Product>> get state => _stateController.stream;

  Sink<CartEvent> get action => _eventsController.sink;

  CartBloc() {
    _eventsController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CartEvent action) async {
    if (action is AddProductEvent) {
      _products = [action.product, ..._products];
    } else if (action is RemoveProductEvent) {
      _products.removeWhere((element) => element == action.product);
    }
    _stateController.add(_products);
  }

  void dispose() {
    _stateController.close();
    _eventsController.close();
  }
}
