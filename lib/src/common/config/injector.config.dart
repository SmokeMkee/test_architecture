// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:talker/talker.dart' as _i7;
import 'package:test_architecture/src/common/config/app_module.dart' as _i31;
import 'package:test_architecture/src/common/config/enviroment/nviroment_config.dart'
    as _i4;
import 'package:test_architecture/src/common/config/logging/app_logger.dart'
    as _i8;
import 'package:test_architecture/src/common/config/logging/console_app_logger.dart'
    as _i9;
import 'package:test_architecture/src/common/config/logging/logging_module.dart'
    as _i29;
import 'package:test_architecture/src/common/config/network/dio_module.dart'
    as _i32;
import 'package:test_architecture/src/common/config/services/session_service.dart'
    as _i6;
import 'package:test_architecture/src/common/domain/models/lifecycle_probe.dart'
    as _i5;
import 'package:test_architecture/src/common/presentation/router/app_router.dart'
    as _i18;
import 'package:test_architecture/src/common/presentation/router/app_router_guard.dart'
    as _i11;
import 'package:test_architecture/src/features/async_lab/config/async_lab_module.dart'
    as _i30;
import 'package:test_architecture/src/features/async_lab/data/services/async_lab_service.dart'
    as _i3;
import 'package:test_architecture/src/features/async_lab/domain/behaviors/async_lab_behavior.dart'
    as _i10;
import 'package:test_architecture/src/features/async_lab/domain/use_cases/dispose_async_lab_use_case.dart'
    as _i14;
import 'package:test_architecture/src/features/async_lab/domain/use_cases/observe_async_lab_search_use_case.dart'
    as _i16;
import 'package:test_architecture/src/features/async_lab/domain/use_cases/submit_async_lab_query_use_case.dart'
    as _i17;
import 'package:test_architecture/src/features/async_lab/presentation/blocs/async_lab_bloc.dart'
    as _i19;
import 'package:test_architecture/src/features/auth/config/auth_module.dart'
    as _i34;
import 'package:test_architecture/src/features/auth/data/services/auth_service.dart'
    as _i12;
import 'package:test_architecture/src/features/auth/domain/behaviors/auth_behavior.dart'
    as _i20;
import 'package:test_architecture/src/features/auth/domain/use_cases/get_auth_status_use_case.dart'
    as _i21;
import 'package:test_architecture/src/features/auth/domain/use_cases/sign_in_use_case.dart'
    as _i23;
import 'package:test_architecture/src/features/auth/domain/use_cases/sign_out_use_case.dart'
    as _i24;
import 'package:test_architecture/src/features/auth/presentation/blocs/auth_bloc.dart'
    as _i25;
import 'package:test_architecture/src/features/news/config/news_module.dart'
    as _i33;
import 'package:test_architecture/src/features/news/data/services/news_service.dart'
    as _i22;
import 'package:test_architecture/src/features/news/data/sources/news_source.dart'
    as _i15;
import 'package:test_architecture/src/features/news/domain/behaviors/get_news_behavior.dart'
    as _i26;
import 'package:test_architecture/src/features/news/domain/use_cases/get_news_use_case.dart'
    as _i27;
import 'package:test_architecture/src/features/news/presentation/blocs/news_bloc.dart'
    as _i28;

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
    final loggingModule = _$LoggingModule();
    final asyncLabModule = _$AsyncLabModule();
    final appModule = _$AppModule();
    final dioModule = _$DioModule();
    final newsModule = _$NewsModule();
    final authModule = _$AuthModule();
    gh.lazySingleton<_i3.AsyncLabService>(() => _i3.AsyncLabService());
    gh.lazySingleton<_i4.EnvironmentConfig>(() => _i4.EnvironmentConfig());
    gh.factory<_i5.FactoryProbeService>(() => _i5.FactoryProbeService());
    gh.singleton<_i6.SessionService>(_i6.SessionService());
    gh.singleton<_i5.SingletonProbeService>(_i5.SingletonProbeService());
    gh.lazySingleton<_i7.Talker>(() => loggingModule.talker());
    gh.lazySingleton<_i8.AppLogger>(
        () => _i9.ConsoleAppLogger(gh<_i7.Talker>()));
    gh.factory<_i10.AsyncLabBehavior>(
        () => asyncLabModule.asyncLabBehavior(gh<_i3.AsyncLabService>()));
    gh.lazySingleton<_i11.AuthGuard>(
        () => appModule.authGuard(gh<_i6.SessionService>()));
    gh.lazySingleton<_i12.AuthService>(() => _i12.AuthService(
          gh<_i6.SessionService>(),
          gh<_i8.AppLogger>(),
        ));
    gh.factory<_i13.Dio>(
      () => dioModule.getProtectedDio(gh<_i8.AppLogger>()),
      instanceName: 'public-dio',
    );
    gh.factory<_i14.DisposeAsyncLabUseCase>(
        () => _i14.DisposeAsyncLabUseCase(gh<_i10.AsyncLabBehavior>()));
    gh.factory<_i15.NewsSource>(() => newsModule.newsSource(
          gh<_i13.Dio>(instanceName: 'public-dio'),
          gh<_i4.EnvironmentConfig>(),
        ));
    gh.factory<_i16.ObserveAsyncLabSearchUseCase>(
        () => _i16.ObserveAsyncLabSearchUseCase(gh<_i10.AsyncLabBehavior>()));
    gh.factory<_i17.SubmitAsyncLabQueryUseCase>(
        () => _i17.SubmitAsyncLabQueryUseCase(gh<_i10.AsyncLabBehavior>()));
    gh.lazySingleton<_i18.AppRouter>(
        () => appModule.getRouter(gh<_i11.AuthGuard>()));
    gh.factory<_i19.AsyncLabBloc>(() => _i19.AsyncLabBloc(
          gh<_i16.ObserveAsyncLabSearchUseCase>(),
          gh<_i17.SubmitAsyncLabQueryUseCase>(),
          gh<_i14.DisposeAsyncLabUseCase>(),
        ));
    gh.factory<_i20.AuthBehavior>(
        () => authModule.authBehavior(gh<_i12.AuthService>()));
    gh.factory<_i21.GetAuthStatusUseCase>(
        () => _i21.GetAuthStatusUseCase(gh<_i20.AuthBehavior>()));
    gh.lazySingleton<_i22.NewsService>(
        () => _i22.NewsService(gh<_i15.NewsSource>()));
    gh.factory<_i23.SignInUseCase>(
        () => _i23.SignInUseCase(gh<_i20.AuthBehavior>()));
    gh.factory<_i24.SignOutUseCase>(
        () => _i24.SignOutUseCase(gh<_i20.AuthBehavior>()));
    gh.factory<_i25.AuthBloc>(() => _i25.AuthBloc(
          gh<_i21.GetAuthStatusUseCase>(),
          gh<_i23.SignInUseCase>(),
          gh<_i24.SignOutUseCase>(),
        ));
    gh.factory<_i26.GetNewsBehavior>(
        () => newsModule.getNewsBehavior(gh<_i22.NewsService>()));
    gh.factory<_i27.GetNewsUseCase>(
        () => _i27.GetNewsUseCase(gh<_i26.GetNewsBehavior>()));
    gh.factory<_i28.NewsBloc>(() => _i28.NewsBloc(
          gh<_i27.GetNewsUseCase>(),
          gh<_i8.AppLogger>(),
        ));
    return this;
  }
}

class _$LoggingModule extends _i29.LoggingModule {}

class _$AsyncLabModule extends _i30.AsyncLabModule {}

class _$AppModule extends _i31.AppModule {}

class _$DioModule extends _i32.DioModule {}

class _$NewsModule extends _i33.NewsModule {}

class _$AuthModule extends _i34.AuthModule {}
