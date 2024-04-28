import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_bloc/model/product.dart';

part 'products_state.freezed.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = InitialState;

  const factory ProductsState.loading() = LoadingState;

  const factory ProductsState.success({
    required List<Product> data,
  }) = SuccessState;

  const factory ProductsState.failure({
    required String message,
  }) = FailureState;
}
