import 'package:guide_core/guide_core.dart';

import '../../data/models/index_asset_model.dart';

abstract class IndexRepository {
  Future<Either<IndexAssetModel, Exception>> fetchCollaborator(String name);
}
