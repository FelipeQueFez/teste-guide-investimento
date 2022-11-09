import 'package:guide_core/guide_core.dart';

import '../repositories/index_chart_repository.dart';

class IndexChartUseCase extends UseCase<bool?> {
  IndexChartUseCase(this.repository);

  final IndexChartRepository repository;

  @override
  Future<Either<bool?, dynamic>> execute() async {
    return await repository.template();
  }
}
