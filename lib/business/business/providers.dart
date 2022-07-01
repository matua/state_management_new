import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cart_state.dart';
import 'products_state.dart';

final StateNotifierProvider<CartState, ProductsState> cartStateProvider =
    StateNotifierProvider<CartState, ProductsState>((_) => CartState());
