// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryStore on _CategoryStore, Store {
  Computed<List<Category>> _$allCategoryListComputed;

  @override
  List<Category> get allCategoryList => (_$allCategoryListComputed ??=
          Computed<List<Category>>(() => super.allCategoryList,
              name: '_CategoryStore.allCategoryList'))
      .value;
  Computed<String> _$getErroComputed;

  @override
  String get getErro => (_$getErroComputed ??=
          Computed<String>(() => super.getErro, name: '_CategoryStore.getErro'))
      .value;

  final _$_erroAtom = Atom(name: '_CategoryStore._erro');

  @override
  String get _erro {
    _$_erroAtom.reportRead();
    return super._erro;
  }

  @override
  set _erro(String value) {
    _$_erroAtom.reportWrite(value, super._erro, () {
      super._erro = value;
    });
  }

  final _$_CategoryStoreActionController =
      ActionController(name: '_CategoryStore');

  @override
  void setErro(String e) {
    final _$actionInfo = _$_CategoryStoreActionController.startAction(
        name: '_CategoryStore.setErro');
    try {
      return super.setErro(e);
    } finally {
      _$_CategoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategories(List<Category> categories) {
    final _$actionInfo = _$_CategoryStoreActionController.startAction(
        name: '_CategoryStore.setCategories');
    try {
      return super.setCategories(categories);
    } finally {
      _$_CategoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allCategoryList: ${allCategoryList},
getErro: ${getErro}
    ''';
  }
}
