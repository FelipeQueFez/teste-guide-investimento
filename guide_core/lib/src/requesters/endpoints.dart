FlavorEnum? flavor;

enum FlavorEnum { dev, prod }

abstract class Endpoints {
  static String fetchAsset = _EnvironmentFactory().getEnvironment().baseUrl;
}

abstract class _EnvironmentInterface {
  late String baseUrl;
}

class _EnvironmentFactory {
  _EnvironmentInterface getEnvironment() {
    if (flavor == FlavorEnum.prod) {
      return _EnviromentPROD();
    }

    return _EnviromentPROD();
  }
}

class _EnviromentPROD implements _EnvironmentInterface {
  static final _EnviromentPROD _singleton = _EnviromentPROD._internal();

  _EnviromentPROD._internal();

  factory _EnviromentPROD() {
    return _singleton;
  }

  @override
  String baseUrl = "https://query2.finance.yahoo.com/v8/finance/chart/";
}
