// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$searchAtom = Atom(name: '_HomeStore.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$errorAtom = Atom(name: '_HomeStore.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$loadingAtom = Atom(name: '_HomeStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$categoryAtom = Atom(name: '_HomeStore.category');

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

  final _$filterAtom = Atom(name: '_HomeStore.filter');

  @override
  FilterStore get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(FilterStore value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  void setSearch(dynamic valeu) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.setSearch');
    try {
      return super.setSearch(valeu);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(dynamic valeu) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.setError');
    try {
      return super.setError(valeu);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(dynamic valeu) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.setLoading');
    try {
      return super.setLoading(valeu);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(dynamic valeu) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setCategory');
    try {
      return super.setCategory(valeu);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilter(dynamic valeu) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.setFilter');
    try {
      return super.setFilter(valeu);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
search: ${search},
error: ${error},
loading: ${loading},
category: ${category},
filter: ${filter}
    ''';
  }
}
