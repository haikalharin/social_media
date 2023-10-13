// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector_config.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$InjectorConfig extends InjectorConfig {
  @override
  void _configureBlocs() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => UserPageBloc(c<ArticleRepository>()))
      ..registerSingleton((c) => PostPageBloc(c<ArticleRepository>()));
  }

  @override
  void _configureRepositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory<ArticleRepository>((c) =>
        ArticleRepositoryImpl(c<RemoteDataSource>(), c<NetworkInfoImpl>()));
  }

  @override
  void _configureDataSources() {
    final KiwiContainer container = KiwiContainer();
    container
        .registerFactory((c) => RemoteDataSource(httpClient: c<HttpClient>()));
  }

  @override
  void _configureExternal() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => HttpClient());
  }

  @override
  void _configureCommon() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => NetworkInfoImpl());
  }

  @override
  void _configureUtils() {}
  @override
  void _configureDao() {}
}
