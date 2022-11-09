import 'package:guide_core/guide_core.dart';

import 'index_databinding.dart';

class StateIndex extends BaseState {
  final IndexDatabinding databinding;
  StateIndex({
    required BaseLoadingState loading,
    required String? errorMessage,
    required this.databinding,
  }) : super(
          loading: loading,
          errorMessage: errorMessage,
        );

  factory StateIndex.initial() {
    return StateIndex(
      databinding: IndexDatabinding.initial(),
      loading: BaseLoadingState.initial,
      errorMessage: null,
    );
  }

  StateIndex copyWith({
    IndexDatabinding? databinding,
    String? errorMessage,
    BaseLoadingState? loading,
  }) {
    return StateIndex(
      databinding: databinding ?? this.databinding,
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
