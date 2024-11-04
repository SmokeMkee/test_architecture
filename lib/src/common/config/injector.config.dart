// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:test_architecture/src/common/config/app_module.dart' as _i11;
import 'package:test_architecture/src/common/config/enviroment/nviroment_config.dart'
    as _i5;
import 'package:test_architecture/src/common/config/network/dio_module.dart'
    as _i12;
import 'package:test_architecture/src/common/presentation/router/app_router.dart'
    as _i3;
import 'package:test_architecture/src/features/news/config/news_module.dart'
    as _i13;
import 'package:test_architecture/src/features/news/data/services/news_service.dart'
    as _i7;
import 'package:test_architecture/src/features/news/data/sources/news_source.dart'
    as _i6;
import 'package:test_architecture/src/features/news/domain/behaviors/get_news_behavior.dart'
    as _i8;
import 'package:test_architecture/src/features/news/domain/use_cases/get_news_use_case.dart'
    as _i9;
import 'package:test_architecture/src/features/news/presentation/blocs/news_bloc.dart'
    as _i10;

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
    final appModule = _$AppModule();
    final dioModule = _$DioModule();
    final newsModule = _$NewsModule();
    gh.lazySingleton<_i3.AppRouter>(() => appModule.getRouter());
    gh.factory<_i4.Dio>(
      () => dioModule.getProtectedDio(),
      instanceName: 'public-dio',
    );
    gh.lazySingleton<_i5.EnvironmentConfig>(() => _i5.EnvironmentConfig());
    gh.factory<_i6.NewsSource>(() => newsModule.newsSource(
          gh<_i4.Dio>(instanceName: 'public-dio'),
          gh<_i5.EnvironmentConfig>(),
        ));
    gh.lazySingleton<_i7.NewsService>(
        () => _i7.NewsService(gh<_i6.NewsSource>()));
    gh.factory<_i8.GetNewsBehavior>(
        () => newsModule.getNewsBehavior(gh<_i7.NewsService>()));
    gh.factory<_i9.GetNewsUseCase>(
        () => _i9.GetNewsUseCase(gh<_i8.GetNewsBehavior>()));
    gh.factory<_i10.NewsBloc>(() => _i10.NewsBloc(gh<_i9.GetNewsUseCase>()));
    return this;
  }
}

class _$AppModule extends _i11.AppModule {}

class _$DioModule extends _i12.DioModule {}

class _$NewsModule extends _i13.NewsModule {}
