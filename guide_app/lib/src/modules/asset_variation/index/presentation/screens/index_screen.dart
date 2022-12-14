import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guide_app/src/global_instance.dart';
import 'package:guide_app/src/guide_app_routes.dart';
import 'package:guide_core/guide_core.dart' show BaseLoadingState, Tr;
import 'package:guide_ui/guide_ui.dart';
import '../stores/index_store.dart';
import '../widgets/charts/bar_chart_simple.dart';
import '../widgets/charts/line_chart_simple.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  late IndexStore store;

  @override
  void initState() {
    super.initState();

    store = sl<IndexStore>();
    //TODO:in development
    store.searchAsset('PETR4.SA');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GuideScaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.pushNamed(
          //   context,
          //   GuideAppRoutes.index_chart,
          // );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          Tr.of(context, "index.title"),
        ),
      ),
      child: GuideContainer(
        child: _body(
          context: context,
          size: size,
        ),
      ),
    );
  }

  Widget _body({
    required BuildContext context,
    required size,
  }) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Observer(
            builder: ((context) {
              if (store.state.loading == BaseLoadingState.loading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                );
              } else if (store.state.loading == BaseLoadingState.error) {
                return Center(
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Text(store.state.errorMessage!),
                  ),
                );
              } else if (store.state.loading == BaseLoadingState.loaded) {
                return Column(
                  children: [
                    LineChartSimple(
                      model: store.state.databinding.model!,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BarChartSimple(
                      model: store.state.databinding.model!,
                    ),
                  ],
                );
              } else if (store.state.loading == BaseLoadingState.empty) {
                return Center(
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Text(
                      Tr.of(context, "index.empty"),
                    ),
                  ),
                );
              }
              return Container();
            }),
          ),
        ],
      ),
    );
  }
}
