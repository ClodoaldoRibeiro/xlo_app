// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inserir_anucio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InserirAnucioStore on _InserirAnucioStore, Store {
  Computed<int> _$imagesLengthComputed;

  @override
  int get imagesLength =>
      (_$imagesLengthComputed ??= Computed<int>(() => super.imagesLength,
              name: '_InserirAnucioStore.imagesLength'))
          .value;
  Computed<bool> _$categoryValidComputed;

  @override
  bool get categoryValid =>
      (_$categoryValidComputed ??= Computed<bool>(() => super.categoryValid,
              name: '_InserirAnucioStore.categoryValid'))
          .value;

  final _$categoryAtom = Atom(name: '_InserirAnucioStore.category');

  @override
  Category get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(Category value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$_InserirAnucioStoreActionController =
      ActionController(name: '_InserirAnucioStore');

  @override
  File getImage(dynamic index) {
    final _$actionInfo = _$_InserirAnucioStoreActionController.startAction(
        name: '_InserirAnucioStore.getImage');
    try {
      return super.getImage(index);
    } finally {
      _$_InserirAnucioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(Category value) {
    final _$actionInfo = _$_InserirAnucioStoreActionController.startAction(
        name: '_InserirAnucioStore.setCategory');
    try {
      return super.setCategory(value);
    } finally {
      _$_InserirAnucioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
category: ${category},
imagesLength: ${imagesLength},
categoryValid: ${categoryValid}
    ''';
  }
}
