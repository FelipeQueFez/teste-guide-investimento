import 'package:guide_app/src/global_instance.dart';
import 'package:guide_core/guide_core.dart';
import 'package:mobx/mobx.dart';
import '../../domain/usecases/index_use_case.dart';

import 'index_state.dart';

part 'index_store.g.dart';

class IndexStore = _IndexStoreBase with _$IndexStore;

abstract class _IndexStoreBase with Store {
  late FetchAssetUseCase fetchAsset;

  @observable
  StateIndex state = StateIndex.initial();

  _IndexStoreBase() : fetchAsset = sl.get<FetchAssetUseCase>();

  @action
  setState(StateIndex stateInput) {
    state = stateInput;
  }

  @action
  init() {
    setState(
      state.copyWith(loading: BaseLoadingState.loaded),
    );
  }
}
