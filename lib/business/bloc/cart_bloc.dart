import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/business/bloc/cart_event.dart';

import 'products_state.dart';

class CartBloc extends Bloc<CartEvent, ProductsState> {
  CartBloc() : super(ProductsState(products: [])) {
    on<AddProductEvent>((event, emit) {
      var newState = state.copyWith(products: state.products);
      var product = event.product;
      if (!state.products.contains(product)) {
        newState.products.insert(0, product);
      } else {
        addError(
            Exception("Product is already in the cart. Only one is allowed."),
            StackTrace.current);
        emit(ErrorState());
      }
      emit(newState);
    });
    on<RemoveProductEvent>((event, emit) {
      var newState = state.copyWith(products: state.products);
      newState.products.removeWhere((element) => element == event.product);
      emit(newState);
    });
    on<CleanCartEvent>((event, emit) {
      var newState = state.copyWith(products: state.products);
      newState.products.clear();
      emit(newState);
    });
  }

  @override
  onError(error, stackTrace) {
    if (kDebugMode) {
      print(error.toString());
    }
    super.onError(error, stackTrace);
  }
}
