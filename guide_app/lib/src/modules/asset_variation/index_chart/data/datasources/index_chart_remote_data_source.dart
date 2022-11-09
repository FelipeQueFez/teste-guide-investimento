abstract class IndexChartRemoteDataSource {
  Future<bool?> template();
}

class IndexChartRemoteDataSourceImpl implements IndexChartRemoteDataSource {
  IndexChartRemoteDataSourceImpl();

  @override
  Future<bool?> template() {
    //CoreCeslaRequester...
    return Future.value(true);
  }
}
