import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_bloc/demo/demo_data.dart';
import 'package:freezed_bloc/domain/repository/product_repo.dart';
import 'package:freezed_bloc/model/product.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<List<Product>> fetchProduct() async {
    await Future.delayed(const Duration(seconds: 2));
    final source = await rootBundle.loadString(DemoData.products);
    final data = await json.decode(source);
    return List<Product>.from(data.map((x) => Product.fromJson(x)));
    // try {
    //
    // } catch (e) {
    //   throw e;
    // }
  }
}
