import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guide_app/src/global_instance.dart';
import 'package:guide_core/guide_core.dart' show BaseLoadingState, Tr;
import 'package:guide_ui/guide_ui.dart';
import '../stores/index_store.dart';

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
    store.init();
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
        title: Text('Titulo'),
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
          SizedBox(
            height: 550,
            child: Observer(
              builder: ((context) {
                //TODO:in development
                // if (store.state.loading == BaseLoadingState.loading) {
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
                  return Text(
                    Tr.of(context, 'index.hello_world'),
                  );
                }
                //TODO:in development
                // else if (store.state.loading == BaseLoadingState.empty) {
                //   return Center(
                //     child: SizedBox(
                //       height: 150,
                //       width: 150,
                //       child: Text(
                //         Tr.of(
                //           context,
                //           "hive.listing_empty",
                //         ),
                //         style: CoreFonts.ubuntubold14greyLabel,
                //       ),
                //     ),
                //   );
                // }
                return Container();
              }),
            ),
          ),
        ],
      ),
    );
  }
}
