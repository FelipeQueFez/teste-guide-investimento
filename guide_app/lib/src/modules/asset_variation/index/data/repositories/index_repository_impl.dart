import 'package:guide_core/guide_core.dart';

import '../../domain/repositories/index_repository.dart';
import '../datasources/index_remote_data_source.dart';
import '../models/index_asset_model.dart';

class IndexRepositoryImpl implements IndexRepository {
  IndexRepositoryImpl({
    required this.remoteDataSource,
  });

  final IndexRemoteDataSource remoteDataSource;

  @override
  Future<Either<IndexAssetModel, Exception>> fetchCollaborator(
      String name) async {
    try {
      var _response = await remoteDataSource.fetchAsset(name);
      return Left(_response);
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }
}
