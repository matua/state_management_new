import '../../data/model/product.dart';

abstract class CartEvent {}

class AddProductEvent extends CartEvent {
  AddProductEvent({required this.product});

  final Product product;
}

class RemoveProductEvent extends CartEvent {
  RemoveProductEvent({required this.product});

  final Product product;
}
