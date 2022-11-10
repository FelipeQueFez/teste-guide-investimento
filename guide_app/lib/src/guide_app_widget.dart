import 'package:flutter/material.dart';
import 'package:guide_ui/guide_ui.dart';
import 'guide_app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:guide_core/guide_core.dart';

import 'modules/asset_variation/index/presentation/screens/index_screen.dart';

class GuideAppWidget extends StatelessWidget {
  const GuideAppWidget({
    Key? key,
    required this.localizedValues,
  }) : super(key: key);

  final Map<String, Map<String, dynamic>> localizedValues;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate(localizedValues),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt'),
        Locale('en'),
      ],
      locale: const Locale('pt'),
      key: const Key("MaterialAppInitial"),
      debugShowCheckedModeBanner: false,
      theme: factoryTheme(context, 'Abel'),
      navigatorKey: NavigatorKeys.navigatorKey,
      initialRoute: GuideAppRoutes.init,
      routes: {
        GuideAppRoutes.init: (context) => const GuidePageRoute(),
      },
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (localContext) => WillPopScope(
            onWillPop: () async => false,
            child: const GuidePageRoute(),
          ),
        );
      },
    );
  }
}

class GuidePageRoute extends StatelessWidget {
  const GuidePageRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        Widget page = Container();
        var args = settings.arguments == null
            ? ArgumentsModel()
            : settings.arguments as ArgumentsModel;
        switch (settings.name) {
          case GuideAppRoutes.init:
            page = const IndexScreen();
            break;
        }
        return PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) {
            return page;
          },
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
      },
    );
  }
}
