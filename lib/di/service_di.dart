
import 'package:dio/dio.dart';
import 'package:freezed_bloc/common/network/dio_client.dart';
import 'package:freezed_bloc/common/utils/const_string.dart';
import 'package:freezed_bloc/di/injection_service.dart';

Future<void> setupServiceModule() async {
  di.registerLazySingleton<DioClient>(
    () => DioClient(
      Dio(
        BaseOptions(
          contentType: "application/json",
          baseUrl: ConstString.baseUrl,
        ),
      )
        // ..interceptors.add(
        //   CustomInterceptors(
        //     sharePref: di(),
        //   ),
        // ),
    ),
  );
}
