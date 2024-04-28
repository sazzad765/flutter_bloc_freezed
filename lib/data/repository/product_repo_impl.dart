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

  @override
  Future<Product> updateProduct({
    required int id,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await _dioClient.put('products/$id', data: body);
      final data = response.data;
      return Product.fromJson(data);
    } catch (e) {
      throw Failure.mapDioException(e);
    }
  }
}
