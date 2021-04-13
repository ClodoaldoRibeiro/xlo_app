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
  Computed<bool> _$imageValidComputed;

  @override
  bool get imageValid =>
      (_$imageValidComputed ??= Computed<bool>(() => super.imageValid,
              name: '_InserirAnucioStore.imageValid'))
          .value;
  Computed<bool> _$titleValidComputed;

  @override
  bool get titleValid =>
      (_$titleValidComputed ??= Computed<bool>(() => super.titleValid,
              name: '_InserirAnucioStore.titleValid'))
          .value;
  Computed<bool> _$descriptionValidComputed;

  @override
  bool get descriptionValid => (_$descriptionValidComputed ??= Computed<bool>(
          () => super.descriptionValid,
          name: '_InserirAnucioStore.descriptionValid'))
      .value;
  Computed<bool> _$categoryValidComputed;

  @override
  bool get categoryValid =>
      (_$categoryValidComputed ??= Computed<bool>(() => super.categoryValid,
              name: '_InserirAnucioStore.categoryValid'))
          .value;
  Computed<Address> _$addressComputed;

  @override
  Address get address =>
      (_$addressComputed ??= Computed<Address>(() => super.address,
              name: '_InserirAnucioStore.address'))
          .value;
  Computed<bool> _$addressValidComputed;

  @override
  bool get addressValid =>
      (_$addressValidComputed ??= Computed<bool>(() => super.addressValid,
              name: '_InserirAnucioStore.addressValid'))
          .value;
  Computed<num> _$priceComputed;

  @override
  num get price => (_$priceComputed ??=
          Computed<num>(() => super.price, name: '_InserirAnucioStore.price'))
      .value;
  Computed<bool> _$formValidComputed;

  @override
  bool get formValid =>
      (_$formValidComputed ??= Computed<bool>(() => super.formValid,
              name: '_InserirAnucioStore.formValid'))
          .value;
  Computed<Function> _$sendPressedComputed;

  @override
  Function get sendPressed =>
      (_$sendPressedComputed ??= Computed<Function>(() => super.sendPressed,
              name: '_InserirAnucioStore.sendPressed'))
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

  final _$cepStoreAtom = Atom(name: '_InserirAnucioStore.cepStore');

  @override
  CepStore get cepStore {
    _$cepStoreAtom.reportRead();
    return super.cepStore;
  }

  @override
  set cepStore(CepStore value) {
    _$cepStoreAtom.reportWrite(value, super.cepStore, () {
      super.cepStore = value;
    });
  }

  final _$priceTextAtom = Atom(name: '_InserirAnucioStore.priceText');

  @override
  String get priceText {
    _$priceTextAtom.reportRead();
    return super.priceText;
  }

  @override
  set priceText(String value) {
    _$priceTextAtom.reportWrite(value, super.priceText, () {
      super.priceText = value;
    });
  }

  final _$showErrorsAtom = Atom(name: '_InserirAnucioStore.showErrors');

  @override
  bool get showErrors {
    _$showErrorsAtom.reportRead();
    return super.showErrors;
  }

  @override
  set showErrors(bool value) {
    _$showErrorsAtom.reportWrite(value, super.showErrors, () {
      super.showErrors = value;
    });
  }

  final _$loadingAtom = Atom(name: '_InserirAnucioStore.loading');

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

  final _$errorAtom = Atom(name: '_InserirAnucioStore.error');

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

  final _$savedAdAtom = Atom(name: '_InserirAnucioStore.savedAd');

  @override
  bool get savedAd {
    _$savedAdAtom.reportRead();
    return super.savedAd;
  }

  @override
  set savedAd(bool value) {
    _$savedAdAtom.reportWrite(value, super.savedAd, () {
      super.savedAd = value;
    });
  }

  final _$_sendAsyncAction = AsyncAction('_InserirAnucioStore._send');

  @override
  Future<void> _send() {
    return _$_sendAsyncAction.run(() => super._send());
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
  dynamic getImage(dynamic index) {
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
  void setPrice(String value) {
    final _$actionInfo = _$_InserirAnucioStoreActionController.startAction(
        name: '_InserirAnucioStore.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_InserirAnucioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$_InserirAnucioStoreActionController.startAction(
        name: '_InserirAnucioStore.invalidSendPressed');
    try {
      return super.invalidSendPressed();
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
cepStore: ${cepStore},
priceText: ${priceText},
showErrors: ${showErrors},
loading: ${loading},
error: ${error},
savedAd: ${savedAd},
imagesLength: ${imagesLength},
imageValid: ${imageValid},
titleValid: ${titleValid},
descriptionValid: ${descriptionValid},
categoryValid: ${categoryValid},
address: ${address},
addressValid: ${addressValid},
price: ${price},
formValid: ${formValid},
sendPressed: ${sendPressed}
    ''';
  }
}
