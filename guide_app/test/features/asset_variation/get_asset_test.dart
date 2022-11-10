import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:guide_app/src/modules/asset_variation/index/data/datasources/index_remote_data_source.dart';
import 'package:guide_app/src/modules/asset_variation/index/data/repositories/index_repository_impl.dart';
import 'package:guide_app/src/modules/asset_variation/index/domain/repositories/index_repository.dart';
import 'package:guide_app/src/modules/asset_variation/index/domain/usecases/index_use_case.dart';
import 'package:guide_core/guide_core.dart';

void main() {
  late FetchAssetUseCase usecase;
  late IndexRepository repository;
  late IndexRemoteDataSource remoteDataSource;

  setUpAll(() async {
    remoteDataSource = IndexRemoteDataSourceImpl(
      requester: GuideRequester(),
    );
    repository = IndexRepositoryImpl(remoteDataSource: remoteDataSource);
    usecase = FetchAssetUseCase(repository);
  });

  group('Assets - GET', () {
    late Map<String, dynamic> _scenario1;

    setUp(() {
      _scenario1 =
          json.decode(mockReader('asset_variation/get_asset/scenario_1.json'));
    });

    test('get asset detail', () async {
      final response = await usecase.call(_scenario1['name']);

      expect(response.isLeft(), true);
    });
  });
}
