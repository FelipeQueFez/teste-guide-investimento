import 'package:guide_core/guide_core.dart';

import '../models/index_asset_model.dart';

abstract class IndexRemoteDataSource {
  Future<IndexAssetModel> fetchAsset(String name);
}

class IndexRemoteDataSourceImpl implements IndexRemoteDataSource {
  final GuideRequesterInterface requester;

  IndexRemoteDataSourceImpl({required this.requester});

  @override
  Future<IndexAssetModel> fetchAsset(String name) async {
    return await requester.fetch(
      url: Endpoints.fetchAsset + name,
      fromJson: (value) => IndexAssetModel.fromJson(value),
    );
  }
}
