import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_bloc/di/injection_service.dart';
import 'package:freezed_bloc/domain/usecase/product/get_product_use_case.dart';
import 'package:freezed_bloc/model/product.dart';
import 'package:freezed_bloc/presentation/product/bloc/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(const ProductsState.initial());

  void fetchProduct() async {
    emit(const ProductsState.loading());
    final useCase = di.get<GetProductUseCase>();
    final result = await useCase();
    result.when(
        success: (value) => emit(ProductsState.success(data: value)),
        failed: (failure) =>
            emit(ProductsState.failure(message: failure.message)));
  }

  void updateProduct() {

    if (state is SuccessState) {
      final data = (state as SuccessState).data;

      var list = List<Product>.from(data);
      list.add(Product(id: 0, title: 'Hello'));
      emit(ProductsState.success(data: list));
    }
  }
}
