import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guide_app/src/global_instance.dart';
import 'package:guide_core/guide_core.dart' show BaseLoadingState;
import 'package:guide_ui/guide_ui.dart';

import '../stores/index_chart_store.dart';

class IndexChartScreen extends StatefulWidget {
  @override
  _IndexChartScreenState createState() => _IndexChartScreenState();
}

class _IndexChartScreenState extends State<IndexChartScreen> {
  late IndexChartStore store;

  @override
  void initState() {
    super.initState();

    store = sl<IndexChartStore>();
    store.template();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GuideScaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        //TODO:in development
        title: Text('Titulo 2'),
      ),
      child: GuideContainer(
        child: _body(size: size),
      ),
    );
  }

  Widget _body({required size}) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 550,
            child: Observer(builder: ((context) {
              //TODO:in development
              // if (controller.state is StateIndexChartLoading) {
              //   return const Center(
              //     child: SizedBox(
              //       height: 50,
              //       width: 150,
              //       child: LoadingWidget(),
              //     ),
              //   );
              // } else
              if (store.state.loading == BaseLoadingState.error) {
                return Center(
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Text(store.state.errorMessage!),
                  ),
                );
              } else if (store.state.loading == BaseLoadingState.loaded) {
                //TODO:in development
                return Center(
                  child: Text(
                    'Clean architecture implementado com sucesso',
                  ),
                );
              }
              return Container();
            })),
          ),
        ],
      ),
    );
  }
}
