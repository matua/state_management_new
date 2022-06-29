import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/product.dart';

part 'products_state.freezed.dart';

@unfreezed
class ProductsState with _$ProductsState {
  factory ProductsState({
    required List<Product> products,
  }) = _ProductsState;
}
