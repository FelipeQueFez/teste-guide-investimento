import 'package:guide_app/src/global_instance.dart';
import 'package:guide_core/guide_core.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecases/index_chart_use_case.dart';
import 'index_chart_state.dart';

part 'index_chart_store.g.dart';

class IndexChartStore = _IndexChartStoreBase with _$IndexChartStore;

abstract class _IndexChartStoreBase with Store {
  late IndexChartUseCase useCase;

  @observable
  StateIndexChart state = StateIndexChart.initial();

  _IndexChartStoreBase() : useCase = sl.get<IndexChartUseCase>();

  @action
  setState(StateIndexChart stateInput) {
    state = stateInput;
  }

  @action
  template() async {
    setState(state.copyWith(loading: BaseLoadingState.loading));
    try {
      await useCase.execute();

      setState(state.copyWith(loading: BaseLoadingState.loaded));
    } catch (e) {
      setState(state.copyWith(errorMessage: e.toString()));
    }
  }
}
