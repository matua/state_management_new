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
    try {
      if (action is AddProductEvent) {
        if (!_products.contains(action.product)) {
          _products = [action.product, ..._products];
        } else {
          throw Exception(
              "Product is already in the cart. Only one is allowed.");
        }
      } else if (action is RemoveProductEvent) {
        _products.removeWhere((element) => element == action.product);
      } else if (action is CleanCartEvent) {
        _products.clear();
      }
      _stateController.add(_products);
    } catch (e) {
      _stateController.addError(e);
    }
  }

  void dispose() {
    _stateController.close();
    _eventsController.close();
  }
}
