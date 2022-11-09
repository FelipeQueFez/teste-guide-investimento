import 'package:guide_core/guide_core.dart';

import 'data/datasources/index_chart_remote_data_source.dart';
import 'data/repositories/index_chart_repository_impl.dart';
import 'domain/repositories/index_chart_repository.dart';
import 'domain/usecases/index_chart_use_case.dart';
import 'presentation/stores/index_chart_store.dart';

class IndexChartServiceLocatorConfig
    implements ServiceLocatorConfigInternals, ServiceLocatorConfig {
  @override
  Future<void> configure(ServiceLocatorWrapper sl) async {
    registerManagerState(sl);
    registerUseCases(sl);
    registerRepositories(sl);
    registerDataSources(sl);
    registerServices(sl);
  }

  @override
  void registerManagerState(ServiceLocatorWrapper sl) {
    sl.registerFactory(() => IndexChartStore());
  }

  @override
  void registerDataSources(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<IndexChartRemoteDataSource>(
        () => IndexChartRemoteDataSourceImpl());
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<IndexChartRepository>(() =>
        IndexChartRepositoryImpl(
            remoteDataSource: sl<IndexChartRemoteDataSource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(() => IndexChartUseCase(sl<IndexChartRepository>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
