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

  @action
  searchAsset(String name) async {
    try {
      setState(
        state.copyWith(loading: BaseLoadingState.loading),
      );

      var _result = await fetchAsset.call(name);
      _result.fold((success) {
        setState(
          state.copyWith(
            databinding: state.databinding.copyWith(
              model: success,
            ),
            loading: BaseLoadingState.loaded,
          ),
        );
      }, (error) {
        setState(
          state.copyWith(
            loading: BaseLoadingState.error,
            errorMessage: error.toString(),
          ),
        );
      });
    } catch (e) {
      setState(
        state.copyWith(
          loading: BaseLoadingState.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
