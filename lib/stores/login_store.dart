import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_app/helper/extension.dart';
import 'package:xlo_app/repositories/user_repository.dart';
import 'package:xlo_app/stores/user_manager_store.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String _email;

  @observable
  String _senha;

  @observable
  bool _loading = false;

  @observable
  bool _passwordVisibility = false;

  @observable
  String _erro;

  //Validar dados do E-mail
  @action
  void setEmail(String email) {
    this._email = email;
  }

  @computed
  String get getEmail {
    return this._email;
  }

  bool get emailValid {
    return _email != null && _email.isEmailValid();
  }

  @computed
  String get emailErro {
    if (_email == null || emailValid)
      return null;
    else
      return "E-mail inválido";
  }

  /// Validar dados da senha
  @action
  void setSenha(String senha) {
    this._senha = senha;
  }

  @computed
  String get getSenha {
    return this._senha;
  }

  bool get senhaValid {
    return _senha != null && _senha.length >= 4;
  }

  @computed
  String get senhaErro {
    if (_senha == null || senhaValid)
      return null;
    else
      return "Senha muito curta";
  }

  bool get isFormValid {
    return emailValid && senhaValid;
  }

  @computed
  Function get loginPressed {
    return (isFormValid && !_loading) ? login : null;
  }

  @action
  Future<void> login() async {
    _loading = true;

    try {
      final user = await UserRepository().loginWithEmail(_email, _senha);
      GetIt.I<UserManagerStore>().setUser(user);
    } catch (e) {
      print(e);
      _erro = e;
    }

    _loading = false;
  }

  @computed
  bool get getLoading {
    return this._loading;
  }

  @computed
  String get getErro {
    return this._erro;
  }

  @computed
  bool get isPasswordVisibility {
    return _passwordVisibility;
  }

  @action
  void togglePasswordVisibility() {
    _passwordVisibility = !_passwordVisibility;
  }
}
