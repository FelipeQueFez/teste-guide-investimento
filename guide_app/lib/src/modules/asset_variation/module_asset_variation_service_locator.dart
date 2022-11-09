import 'package:guide_core/guide_core.dart';
import 'index/index_service_locator.dart';

class ModuleAssetVariationServiceLocator implements ServiceLocatorModuleConfig {
  final List<ServiceLocatorConfig> _features = [
    IndexServiceLocatorConfig(),
  ];

  @override
  void setup(ServiceLocatorWrapper sl) {
    for (var serviceLocatorConfig in _features) {
      serviceLocatorConfig.configure(sl);
    }
  }
}
