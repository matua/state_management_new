import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/product.dart';
import 'products_state.dart';

class CartCubit extends Cubit<ProductsState> {
  CartCubit() : super(ProductsState(products: []));

  void addProduct({required Product product}) {
    var newState = state.copyWith(products: state.products);
    if (!state.products.contains(product)) {
      newState.products.insert(0, product);
    } else {
      addError(
          Exception("Product is already in the cart. Only one is allowed."),
          StackTrace.current);
    }
    emit(newState);
  }

  void removeProduct({required Product product}) {
    var newState = state.copyWith(products: state.products);
    newState.products.removeWhere((element) => element == product);
    emit(newState);
  }

  void clearCart() {
    var newState = state.copyWith(products: state.products);
    newState.products.clear();
    emit(newState);
  }
}
