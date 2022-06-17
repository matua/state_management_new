import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/product.dart';

final cartStateProvider = StateProvider((ref) => CartStateNotifier());

class CartStateNotifier extends StateNotifier<List<Product>> {
  CartStateNotifier() : super(List<Product>.empty(growable: true));

  void addProductToCart({required Product product}) => state.add(product);
}
