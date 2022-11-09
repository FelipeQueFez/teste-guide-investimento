import 'package:guide_core/guide_core.dart';

import 'index_chart_databinding.dart';

class StateIndexChart extends BaseState {
  final IndexChartDatabinding databinding;
  StateIndexChart({
    required BaseLoadingState loading,
    required String? errorMessage,
    required this.databinding,
  }) : super(
          loading: loading,
          errorMessage: errorMessage,
        );

  factory StateIndexChart.initial() {
    return StateIndexChart(
      databinding: IndexChartDatabinding.initial(),
      loading: BaseLoadingState.initial,
      errorMessage: null,
    );
  }

  StateIndexChart copyWith({
    IndexChartDatabinding? databinding,
    String? errorMessage,
    BaseLoadingState? loading,
  }) {
    return StateIndexChart(
      databinding: databinding ?? this.databinding,
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
