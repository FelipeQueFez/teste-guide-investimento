import 'package:guide_core/guide_core.dart';

import 'data/datasources/index_remote_data_source.dart';
import 'data/repositories/index_repository_impl.dart';
import 'domain/repositories/index_repository.dart';
import 'domain/usecases/index_use_case.dart';
import 'presentation/stores/index_store.dart';

class IndexServiceLocatorConfig
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
    sl.registerFactory(() => IndexStore());
  }

  @override
  void registerDataSources(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<IndexRemoteDataSource>(
        () => IndexRemoteDataSourceImpl(requester: GuideRequester()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<IndexRepository>(() =>
        IndexRepositoryImpl(remoteDataSource: sl<IndexRemoteDataSource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(() => FetchAssetUseCase(sl<IndexRepository>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
