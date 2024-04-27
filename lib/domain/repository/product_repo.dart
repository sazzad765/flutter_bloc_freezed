import 'package:freezed_bloc/model/product.dart';

abstract class ProductRepository{
  Future<List<Product>> fetchProduct();

}