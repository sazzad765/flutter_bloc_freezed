import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_bloc/common/network/dio_client.dart';
import 'package:freezed_bloc/common/utils/network/failure.dart';
import 'package:freezed_bloc/demo/demo_data.dart';
import 'package:freezed_bloc/domain/repository/product_repo.dart';
import 'package:freezed_bloc/model/product.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl extends ProductRepository {
  ProductRepositoryImpl(this._dioClient);

  final DioClient _dioClient;

  // @override
  // Future<List<Product>> fetchProduct() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   final source = await rootBundle.loadString(DemoData.products);
  //   final data = await json.decode(source);
  //   return List<Product>.from(data.map((x) => Product.fromJson(x)));
  //   // try {
  //   //
  //   // } catch (e) {
  //   //   throw e;
  //   // }
  // }

  @override
  Future<List<Product>> fetchProduct() async {
    try {
      final response = await _dioClient.get('products');
      final data = response.data['products'];
      return List<Product>.from(data.map((x) => Product.fromJson(x)));
    } catch (e) {
      throw Failure.mapDioException(e);
    }
  }
}
