// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IndexStore on _IndexStoreBase, Store {
  late final _$stateAtom =
      Atom(name: '_IndexStoreBase.state', context: context);

  @override
  StateIndex get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(StateIndex value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$searchAssetAsyncAction =
      AsyncAction('_IndexStoreBase.searchAsset', context: context);

  @override
  Future searchAsset(String name) {
    return _$searchAssetAsyncAction.run(() => super.searchAsset(name));
  }

  late final _$_IndexStoreBaseActionController =
      ActionController(name: '_IndexStoreBase', context: context);

  @override
  dynamic setState(StateIndex stateInput) {
    final _$actionInfo = _$_IndexStoreBaseActionController.startAction(
        name: '_IndexStoreBase.setState');
    try {
      return super.setState(stateInput);
    } finally {
      _$_IndexStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic init() {
    final _$actionInfo = _$_IndexStoreBaseActionController.startAction(
        name: '_IndexStoreBase.init');
    try {
      return super.init();
    } finally {
      _$_IndexStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
