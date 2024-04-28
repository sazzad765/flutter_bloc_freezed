import 'package:freezed_bloc/common/utils/network/failure.dart';
import 'package:freezed_bloc/common/utils/network/result.dart';
import 'package:freezed_bloc/domain/repository/product_repo.dart';
import 'package:freezed_bloc/model/product.dart';

import 'package:injectable/injectable.dart';

@LazySingleton()
class UpdateProductUseCase {
  UpdateProductUseCase(this._productRepository);

  final ProductRepository _productRepository;

  Future<Result<Product>> call({
    required int id,
    required Map<String, dynamic> body,
  }) async {
    return _productRepository
        .updateProduct(id: id, body: body)
        .then((value) => Result.success(value))
        .onError((Failure f, stackTrace) => Result.failed(f));
  }
}
