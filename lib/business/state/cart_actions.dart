import '../../data/model/product.dart';

abstract class CartAction {}

class AddProductAction extends CartAction {
  AddProductAction({required this.product});

  final Product product;
}

class RemoveProductAction extends CartAction {
  RemoveProductAction({required this.product});

  final Product product;
}

class CleanCartAction extends CartAction {
  CleanCartAction();
}