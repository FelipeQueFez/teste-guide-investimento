import 'package:flutter/material.dart';
import 'package:guide_core/guide_core.dart';

import 'src/global_instance.dart';
import 'src/guide_app_service_locator.dart';
import 'src/guide_app_widget.dart';

final GetIt root = GetIt.asNewInstance();
final GetIt _injection = GetIt.instance;
final ServiceLocatorWrapper _slWrapper = GetItWrapper(_injection);

void _setupLocator() {
  sl = _slWrapper;
  GuideAppSetupLocator().setup(sl);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _setupLocator();

  var localizedValues = await I18n('assets/i18n/').initializeI18n();

  //Set Environment here
  flavor = FlavorEnum.prod;

  runApp(GuideAppWidget(
    localizedValues: localizedValues,
  ));
}
