import 'package:guide_core/guide_core.dart';

import '../../domain/repositories/index_chart_repository.dart';
import '../datasources/index_chart_remote_data_source.dart';

class IndexChartRepositoryImpl implements IndexChartRepository {
  IndexChartRepositoryImpl({
    required this.remoteDataSource,
  });

  final IndexChartRemoteDataSource remoteDataSource;

  @override
  Future<Either<bool?, Exception>> template() async {
    try {
      var _response = await remoteDataSource.template();
      return Left<bool?, Exception>(_response);
    } on dynamic catch (e) {
      return Right<bool, Exception>(
          (e is Exception) ? e : Exception(e.toString()));
    }
  }
}
