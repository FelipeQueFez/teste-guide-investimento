import 'package:guide_core/guide_core.dart';

import '../../data/models/index_asset_model.dart';
import '../repositories/index_repository.dart';

class FetchAssetUseCase extends UseCaseWithParameter<IndexAssetModel, String> {
  FetchAssetUseCase(this.repository);

  final IndexRepository repository;

  @override
  Future<Either<IndexAssetModel, Exception>> call(String params) async {
    return await repository.fetchCollaborator(params);
  }
}
