import 'package:freezed_bloc/model/product.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProduct();

  Future<Product> updateProduct({
    required int id,
    required Map<String, dynamic> body,
  });
}
