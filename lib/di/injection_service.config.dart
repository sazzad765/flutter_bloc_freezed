// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repository/product_repo_impl.dart' as _i4;
import '../domain/repository/product_repo.dart' as _i3;
import '../domain/usecase/product/get_product_use_case.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ProductRepository>(() => _i4.ProductRepositoryImpl());
    gh.lazySingleton<_i5.GetProductUseCase>(
        () => _i5.GetProductUseCase(gh<_i3.ProductRepository>()));
    return this;
  }
}
