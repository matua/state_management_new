import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'car_notifier.dart';
import 'products_state.dart';

final StateNotifierProvider<CartNotifier, ProductsState> cartStateProvider =
    StateNotifierProvider<CartNotifier, ProductsState>((_) => CartNotifier());
