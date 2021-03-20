// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrieve_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RetrieveStore on _RetrieveStore, Store {
  Computed<String> _$getEmailComputed;

  @override
  String get getEmail =>
      (_$getEmailComputed ??= Computed<String>(() => super.getEmail,
              name: '_RetrieveStore.getEmail'))
          .value;
  Computed<bool> _$getLoadingComputed;

  @override
  bool get getLoading =>
      (_$getLoadingComputed ??= Computed<bool>(() => super.getLoading,
              name: '_RetrieveStore.getLoading'))
          .value;
  Computed<String> _$emailErroComputed;

  @override
  String get emailErro =>
      (_$emailErroComputed ??= Computed<String>(() => super.emailErro,
              name: '_RetrieveStore.emailErro'))
          .value;
  Computed<String> _$getErroComputed;

  @override
  String get getErro => (_$getErroComputed ??=
          Computed<String>(() => super.getErro, name: '_RetrieveStore.getErro'))
      .value;
  Computed<String> _$getSuccessComputed;

  @override
  String get getSuccess =>
      (_$getSuccessComputed ??= Computed<String>(() => super.getSuccess,
              name: '_RetrieveStore.getSuccess'))
          .value;

  final _$_emailAtom = Atom(name: '_RetrieveStore._email');

  @override
  String get _email {
    _$_emailAtom.reportRead();
    return super._email;
  }

  @override
  set _email(String value) {
    _$_emailAtom.reportWrite(value, super._email, () {
      super._email = value;
    });
  }

  final _$_loadingAtom = Atom(name: '_RetrieveStore._loading');

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  final _$_erroAtom = Atom(name: '_RetrieveStore._erro');

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

  final _$_successAtom = Atom(name: '_RetrieveStore._success');

  @override
  String get _success {
    _$_successAtom.reportRead();
    return super._success;
  }

  @override
  set _success(String value) {
    _$_successAtom.reportWrite(value, super._success, () {
      super._success = value;
    });
  }

  final _$recuperarSenhaAsyncAction =
      AsyncAction('_RetrieveStore.recuperarSenha');

  @override
  Future<void> recuperarSenha() {
    return _$recuperarSenhaAsyncAction.run(() => super.recuperarSenha());
  }

  final _$_RetrieveStoreActionController =
      ActionController(name: '_RetrieveStore');

  @override
  void setEmail(String email) {
    final _$actionInfo = _$_RetrieveStoreActionController.startAction(
        name: '_RetrieveStore.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_RetrieveStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$_RetrieveStoreActionController.startAction(
        name: '_RetrieveStore.reset');
    try {
      return super.reset();
    } finally {
      _$_RetrieveStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getEmail: ${getEmail},
getLoading: ${getLoading},
emailErro: ${emailErro},
getErro: ${getErro},
getSuccess: ${getSuccess}
    ''';
  }
}
