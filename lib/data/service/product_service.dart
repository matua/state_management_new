import '../model/product.dart';

class ProductService {
  List<Product> getAllProducts(List<dynamic> decodedJson) {
    return decodedJson
        .map((dynamic product) =>
            Product.fromJson(product as Map<String, dynamic>))
        .toList();
  }
}
