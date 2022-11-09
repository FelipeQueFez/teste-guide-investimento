import 'package:guide_core/guide_core.dart';

abstract class IndexChartRepository {
  Future<Either<bool?, Exception>> template();
}
