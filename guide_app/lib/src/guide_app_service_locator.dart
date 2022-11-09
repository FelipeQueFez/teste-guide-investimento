import 'package:guide_core/guide_core.dart';

import 'modules/asset_variation/module_asset_variation_service_locator.dart';

class GuideAppSetupLocator {
  final List<ServiceLocatorModuleConfig> _modules = [
    ModuleAssetVariationServiceLocator(),
  ];

  final List<ServiceLocatorConfig> _features = [];

  void setup(ServiceLocatorWrapper sl) {
    for (var serviceLocatorConfig in _features) {
      serviceLocatorConfig.configure(sl);
    }

    for (var serviceLocatorConfig in _modules) {
      serviceLocatorConfig.setup(sl);
    }
  }
}
