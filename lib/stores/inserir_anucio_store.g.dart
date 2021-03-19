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
  Computed<bool> _$isImageValidComputed;

  @override
  bool get isImageValid =>
      (_$isImageValidComputed ??= Computed<bool>(() => super.isImageValid,
              name: '_InserirAnucioStore.isImageValid'))
          .value;
  Computed<bool> _$isTitleValidComputed;

  @override
  bool get isTitleValid =>
      (_$isTitleValidComputed ??= Computed<bool>(() => super.isTitleValid,
              name: '_InserirAnucioStore.isTitleValid'))
          .value;
  Computed<bool> _$isDescriptionalidComputed;

  @override
  bool get isDescriptionalid => (_$isDescriptionalidComputed ??= Computed<bool>(
          () => super.isDescriptionalid,
          name: '_InserirAnucioStore.isDescriptionalid'))
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

  final _$hidePhoneAtom = Atom(name: '_InserirAnucioStore.hidePhone');

  @override
  bool get hidePhone {
    _$hidePhoneAtom.reportRead();
    return super.hidePhone;
  }

  @override
  set hidePhone(bool value) {
    _$hidePhoneAtom.reportWrite(value, super.hidePhone, () {
      super.hidePhone = value;
    });
  }

  final _$titleAtom = Atom(name: '_InserirAnucioStore.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_InserirAnucioStore.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$_InserirAnucioStoreActionController =
      ActionController(name: '_InserirAnucioStore');

  @override
  void setHidePhone(bool valeu) {
    final _$actionInfo = _$_InserirAnucioStoreActionController.startAction(
        name: '_InserirAnucioStore.setHidePhone');
    try {
      return super.setHidePhone(valeu);
    } finally {
      _$_InserirAnucioStoreActionController.endAction(_$actionInfo);
    }
  }

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
  void setTitle(String valeu) {
    final _$actionInfo = _$_InserirAnucioStoreActionController.startAction(
        name: '_InserirAnucioStore.setTitle');
    try {
      return super.setTitle(valeu);
    } finally {
      _$_InserirAnucioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String valeu) {
    final _$actionInfo = _$_InserirAnucioStoreActionController.startAction(
        name: '_InserirAnucioStore.setDescription');
    try {
      return super.setDescription(valeu);
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
hidePhone: ${hidePhone},
title: ${title},
description: ${description},
imagesLength: ${imagesLength},
isImageValid: ${isImageValid},
isTitleValid: ${isTitleValid},
isDescriptionalid: ${isDescriptionalid},
categoryValid: ${categoryValid}
    ''';
  }
}
