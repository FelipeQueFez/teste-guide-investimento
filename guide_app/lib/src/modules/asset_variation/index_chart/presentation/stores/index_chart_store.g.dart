// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index_chart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IndexChartStore on _IndexChartStoreBase, Store {
  late final _$stateAtom =
      Atom(name: '_IndexChartStoreBase.state', context: context);

  @override
  StateIndexChart get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(StateIndexChart value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$templateAsyncAction =
      AsyncAction('_IndexChartStoreBase.template', context: context);

  @override
  Future template() {
    return _$templateAsyncAction.run(() => super.template());
  }

  late final _$_IndexChartStoreBaseActionController =
      ActionController(name: '_IndexChartStoreBase', context: context);

  @override
  dynamic setState(StateIndexChart stateInput) {
    final _$actionInfo = _$_IndexChartStoreBaseActionController.startAction(
        name: '_IndexChartStoreBase.setState');
    try {
      return super.setState(stateInput);
    } finally {
      _$_IndexChartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
