import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const Failure._();

  const factory Failure.cancelException({
    required String message,
  }) = CancelException;

  const factory Failure.connectionTimeoutException({
    required String message,
  }) = ConnectionTimeoutException;

  const factory Failure.receiveTimeoutException({
    required String message,
  }) = ReceiveTimeoutException;

  const factory Failure.sendTimeoutException({
    required String message,
  }) = SendTimeoutException;

  const factory Failure.socketException({
    required String message,
  }) = SocketException;

  const factory Failure.unrecognizedException({
    required String message,
  }) = UnrecognizedException;

  const factory Failure.tokenExpiredException({
    required String message,
  }) = TokenEpiredException;

  const factory Failure.serverException({
    required String message,
    required int statusCode,
    dynamic data,
  }) = ServerException;

  const factory Failure.formatException({
    required String message,
  }) = FormatException;

  const factory Failure.serializationException({
    required String message,
  }) = SerializationException;

  static Failure mapDioException(
      Object? exception,
  ) {
    try {
      if (exception is DioException) {
        switch (exception.type) {
          case DioExceptionType.connectionTimeout:
            return const Failure.connectionTimeoutException(
              message: 'Connection not established',
            );
          case DioExceptionType.sendTimeout:
            return const Failure.sendTimeoutException(
              message: 'Send timeout in connection with API server',
            );
          case DioExceptionType.receiveTimeout:
            return const Failure.receiveTimeoutException(
              message: 'Receive timeout in connection with API server',
            );
          case DioExceptionType.badCertificate:
            return const Failure.socketException(
              message: 'SSL certificate is not valid',
            );
          case DioExceptionType.cancel:
            return const Failure.cancelException(
              message: 'Request to API server was cancelled',
            );
          case DioExceptionType.connectionError:
            return const Failure.socketException(
              message: 'No Internet connection',
            );
          case DioExceptionType.badResponse:
            return Failure.serverException(
              message: exception.response?.statusMessage ??
                  'Bad response from API server',
              statusCode: exception.response?.statusCode ?? 400,
              data: exception.response?.data,
            );
          case DioExceptionType.unknown:
          default:
            return const Failure.unrecognizedException(
              message: 'Unknown error occurred',
            );
        }
      }
    } on FormatException catch (e) {
      return Failure.formatException(message: e.message);
    }
    return const Failure.unrecognizedException(
      message: 'Unknown error occurred',
    );
  }

  static Failure mapParsingException(
    Exception exception,
  ) {
    return const Failure.serializationException(
      message: 'Failed to parse network response to model or vice versa',
    );
  }
}
