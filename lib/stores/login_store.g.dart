// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  Computed<String> _$getEmailComputed;

  @override
  String get getEmail => (_$getEmailComputed ??=
          Computed<String>(() => super.getEmail, name: '_LoginStore.getEmail'))
      .value;
  Computed<String> _$emailErroComputed;

  @override
  String get emailErro =>
      (_$emailErroComputed ??= Computed<String>(() => super.emailErro,
              name: '_LoginStore.emailErro'))
          .value;
  Computed<String> _$getSenhaComputed;

  @override
  String get getSenha => (_$getSenhaComputed ??=
          Computed<String>(() => super.getSenha, name: '_LoginStore.getSenha'))
      .value;
  Computed<String> _$senhaErroComputed;

  @override
  String get senhaErro =>
      (_$senhaErroComputed ??= Computed<String>(() => super.senhaErro,
              name: '_LoginStore.senhaErro'))
          .value;
  Computed<Function> _$loginPressedComputed;

  @override
  Function get loginPressed =>
      (_$loginPressedComputed ??= Computed<Function>(() => super.loginPressed,
              name: '_LoginStore.loginPressed'))
          .value;
  Computed<bool> _$getLoadingComputed;

  @override
  bool get getLoading =>
      (_$getLoadingComputed ??= Computed<bool>(() => super.getLoading,
              name: '_LoginStore.getLoading'))
          .value;
  Computed<String> _$getErroComputed;

  @override
  String get getErro => (_$getErroComputed ??=
          Computed<String>(() => super.getErro, name: '_LoginStore.getErro'))
      .value;
  Computed<bool> _$isPasswordVisibilityComputed;

  @override
  bool get isPasswordVisibility => (_$isPasswordVisibilityComputed ??=
          Computed<bool>(() => super.isPasswordVisibility,
              name: '_LoginStore.isPasswordVisibility'))
      .value;

  final _$_emailAtom = Atom(name: '_LoginStore._email');

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

  final _$_senhaAtom = Atom(name: '_LoginStore._senha');

  @override
  String get _senha {
    _$_senhaAtom.reportRead();
    return super._senha;
  }

  @override
  set _senha(String value) {
    _$_senhaAtom.reportWrite(value, super._senha, () {
      super._senha = value;
    });
  }

  final _$_loadingAtom = Atom(name: '_LoginStore._loading');

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

  final _$_passwordVisibilityAtom =
      Atom(name: '_LoginStore._passwordVisibility');

  @override
  bool get _passwordVisibility {
    _$_passwordVisibilityAtom.reportRead();
    return super._passwordVisibility;
  }

  @override
  set _passwordVisibility(bool value) {
    _$_passwordVisibilityAtom.reportWrite(value, super._passwordVisibility, () {
      super._passwordVisibility = value;
    });
  }

  final _$_erroAtom = Atom(name: '_LoginStore._erro');

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

  final _$loginAsyncAction = AsyncAction('_LoginStore.login');

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

  @override
  void setEmail(String email) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String senha) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setSenha');
    try {
      return super.setSenha(senha);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePasswordVisibility() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.togglePasswordVisibility');
    try {
      return super.togglePasswordVisibility();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getEmail: ${getEmail},
emailErro: ${emailErro},
getSenha: ${getSenha},
senhaErro: ${senhaErro},
loginPressed: ${loginPressed},
getLoading: ${getLoading},
getErro: ${getErro},
isPasswordVisibility: ${isPasswordVisibility}
    ''';
  }
}
