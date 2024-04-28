import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_bloc/model/product.dart';

part 'product_update_state.freezed.dart';

@freezed
class ProductUpdateState with _$ProductUpdateState {
  const factory ProductUpdateState.initial() = InitialState;

  const factory ProductUpdateState.loading() = LoadingState;

  const factory ProductUpdateState.success({
    required String message,
  }) = SuccessState;

  const factory ProductUpdateState.failure({
    required String message,
  }) = FailureState;
}
