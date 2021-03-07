// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupStore on _SignupStore, Store {
  Computed<String> _$getNomeComputed;

  @override
  String get getNome => (_$getNomeComputed ??=
          Computed<String>(() => super.getNome, name: '_SignupStore.getNome'))
      .value;
  Computed<String> _$nameErroComputed;

  @override
  String get nameErro => (_$nameErroComputed ??=
          Computed<String>(() => super.nameErro, name: '_SignupStore.nameErro'))
      .value;
  Computed<String> _$getEmailComputed;

  @override
  String get getEmail => (_$getEmailComputed ??=
          Computed<String>(() => super.getEmail, name: '_SignupStore.getEmail'))
      .value;
  Computed<String> _$emailErroComputed;

  @override
  String get emailErro =>
      (_$emailErroComputed ??= Computed<String>(() => super.emailErro,
              name: '_SignupStore.emailErro'))
          .value;
  Computed<String> _$getPhoneComputed;

  @override
  String get getPhone => (_$getPhoneComputed ??=
          Computed<String>(() => super.getPhone, name: '_SignupStore.getPhone'))
      .value;
  Computed<String> _$phoneErroComputed;

  @override
  String get phoneErro =>
      (_$phoneErroComputed ??= Computed<String>(() => super.phoneErro,
              name: '_SignupStore.phoneErro'))
          .value;
  Computed<String> _$getSenhaComputed;

  @override
  String get getSenha => (_$getSenhaComputed ??=
          Computed<String>(() => super.getSenha, name: '_SignupStore.getSenha'))
      .value;
  Computed<String> _$senhaErroComputed;

  @override
  String get senhaErro =>
      (_$senhaErroComputed ??= Computed<String>(() => super.senhaErro,
              name: '_SignupStore.senhaErro'))
          .value;
  Computed<String> _$getConfirSenhaComputed;

  @override
  String get getConfirSenha =>
      (_$getConfirSenhaComputed ??= Computed<String>(() => super.getConfirSenha,
              name: '_SignupStore.getConfirSenha'))
          .value;
  Computed<String> _$confirSenhaErroComputed;

  @override
  String get confirSenhaErro => (_$confirSenhaErroComputed ??= Computed<String>(
          () => super.confirSenhaErro,
          name: '_SignupStore.confirSenhaErro'))
      .value;
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SignupStore.isFormValid'))
          .value;
  Computed<Function> _$signUpPressedComputed;

  @override
  Function get signUpPressed =>
      (_$signUpPressedComputed ??= Computed<Function>(() => super.signUpPressed,
              name: '_SignupStore.signUpPressed'))
          .value;
  Computed<bool> _$getLoadingComputed;

  @override
  bool get getLoading =>
      (_$getLoadingComputed ??= Computed<bool>(() => super.getLoading,
              name: '_SignupStore.getLoading'))
          .value;
  Computed<String> _$getErroComputed;

  @override
  String get getErro => (_$getErroComputed ??=
          Computed<String>(() => super.getErro, name: '_SignupStore.getErro'))
      .value;

  final _$_nomeAtom = Atom(name: '_SignupStore._nome');

  @override
  String get _nome {
    _$_nomeAtom.reportRead();
    return super._nome;
  }

  @override
  set _nome(String value) {
    _$_nomeAtom.reportWrite(value, super._nome, () {
      super._nome = value;
    });
  }

  final _$_emailAtom = Atom(name: '_SignupStore._email');

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

  final _$_phoneAtom = Atom(name: '_SignupStore._phone');

  @override
  String get _phone {
    _$_phoneAtom.reportRead();
    return super._phone;
  }

  @override
  set _phone(String value) {
    _$_phoneAtom.reportWrite(value, super._phone, () {
      super._phone = value;
    });
  }

  final _$_senhaAtom = Atom(name: '_SignupStore._senha');

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

  final _$_confirSenhaAtom = Atom(name: '_SignupStore._confirSenha');

  @override
  String get _confirSenha {
    _$_confirSenhaAtom.reportRead();
    return super._confirSenha;
  }

  @override
  set _confirSenha(String value) {
    _$_confirSenhaAtom.reportWrite(value, super._confirSenha, () {
      super._confirSenha = value;
    });
  }

  final _$_loadingAtom = Atom(name: '_SignupStore._loading');

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

  final _$_erroAtom = Atom(name: '_SignupStore._erro');

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

  final _$signUpAsyncAction = AsyncAction('_SignupStore.signUp');

  @override
  Future<void> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  final _$_SignupStoreActionController = ActionController(name: '_SignupStore');

  @override
  void setNome(String nome) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setNome');
    try {
      return super.setNome(nome);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String email) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String phone) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setPhone');
    try {
      return super.setPhone(phone);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String senha) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setSenha');
    try {
      return super.setSenha(senha);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirSenha(String confirSenha) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setConfirSenha');
    try {
      return super.setConfirSenha(confirSenha);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getNome: ${getNome},
nameErro: ${nameErro},
getEmail: ${getEmail},
emailErro: ${emailErro},
getPhone: ${getPhone},
phoneErro: ${phoneErro},
getSenha: ${getSenha},
senhaErro: ${senhaErro},
getConfirSenha: ${getConfirSenha},
confirSenhaErro: ${confirSenhaErro},
isFormValid: ${isFormValid},
signUpPressed: ${signUpPressed},
getLoading: ${getLoading},
getErro: ${getErro}
    ''';
  }
}
