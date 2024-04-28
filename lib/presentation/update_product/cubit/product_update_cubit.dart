import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_bloc/di/injection_service.dart';
import 'package:freezed_bloc/domain/usecase/product/get_product_use_case.dart';
import 'package:freezed_bloc/domain/usecase/product/update_product_use_case.dart';
import 'package:freezed_bloc/presentation/product/bloc/products_cubit.dart';
import 'package:freezed_bloc/presentation/update_product/cubit/product_update_state.dart';

class ProductUpdateCubit extends Cubit<ProductUpdateState> {
  ProductUpdateCubit({required ProductsCubit productsCubit})
      : _productsCubit = productsCubit,
        super(const ProductUpdateState.initial());
  final ProductsCubit _productsCubit;

  void updateProduct({
    required int id,
    required String title,
  }) async {
    emit(const ProductUpdateState.loading());
    final useCase = di.get<UpdateProductUseCase>();
    final result = await useCase(id: id, body: {
      'title': title,
    });
    result.when(
        success: (value) {
          // _productsCubit.updateProduct();
          emit(ProductUpdateState.success(message: 'Success'));
        },
        failed: (failure) =>
            emit(ProductUpdateState.failure(message: failure.message)));
  }
}
