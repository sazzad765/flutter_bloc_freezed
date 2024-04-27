import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection_service.config.dart';

final di = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
mixin InjectionService {
  static void initInjection() => di.init();

  static Future<void> config() async{
    initInjection();
  }
}
