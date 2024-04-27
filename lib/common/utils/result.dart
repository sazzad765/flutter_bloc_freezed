import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_bloc/common/utils/failure.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T value) = SuccessResult;

  const factory Result.failed(Failure failure) = FailedResult;
}
