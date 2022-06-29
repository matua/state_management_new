import 'dart:convert';

import '../model/product.dart';
import '../sample_data.dart';

/*DUMMY PRODUCT SERVICE*/

class ProductService {
  List<Product> getAllProducts() {
    return (jsonDecode(SampleData().productsJsonString) as List<dynamic>)
        .map((dynamic product) =>
            Product.fromJson(product as Map<String, dynamic>))
        .toList();
  }
}
