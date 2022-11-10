import '../../data/models/index_asset_model.dart';

class IndexDatabinding {
  IndexDatabinding({
    required this.model,
  });

  final IndexAssetModel? model;

  factory IndexDatabinding.initial() {
    return IndexDatabinding(
      model: null,
    );
  }

  IndexDatabinding copyWith({
    IndexAssetModel? model,
  }) {
    return IndexDatabinding(
      model: model ?? this.model,
    );
  }
}
