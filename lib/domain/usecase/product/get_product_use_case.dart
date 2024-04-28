import 'package:freezed_bloc/common/utils/network/failure.dart';
import 'package:freezed_bloc/common/utils/network/result.dart';
import 'package:freezed_bloc/domain/repository/product_repo.dart';
import 'package:freezed_bloc/model/product.dart';

import 'package:injectable/injectable.dart';

@LazySingleton()
class GetProductUseCase {
  GetProductUseCase(this._productRepository);

  final ProductRepository _productRepository;

  Future<Result<List<Product>>> call() async {
    return _productRepository
        .fetchProduct()
        .then((value) => Result.success(value))
        .onError((Failure f, stackTrace) => Result.failed(f));
  }
}
