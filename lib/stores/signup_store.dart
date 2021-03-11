import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_app/helper/extension.dart';
import 'package:xlo_app/models/user_model.dart';
import 'package:xlo_app/repositories/user_repository.dart';
import 'package:xlo_app/stores/user_manager_store.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {
  @observable
  String _nome;

  @observable
  String _email;

  @observable
  String _phone;

  @observable
  String _senha;

  @observable
  String _confirSenha;

  @observable
  bool _loading = false;

  @observable
  String _erro;

  @action
  void setNome(String nome) {
    this._nome = nome;
  }

  @computed
  String get getNome {
    return this._nome;
  }

  @computed
  String get nameErro {
    if (nomeIsNull || nomeValid)
      return null;
    else if (_nome.isEmpty)
      return "Nome obrigatório";
    else
      return "Nome muito curto";
  }

  bool get nomeValid {
    return _nome != null && _nome.length > 6;
  }

  bool get nomeIsNull {
    return _nome == null;
  }

  /// Validar dados do E-mail

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
    else if (_email.isEmpty)
      return "Campo obrigatório";
    else
      return "E-mail inválido";
  }

  /// Validar dados do telefone
  @action
  void setPhone(String phone) {
    this._phone = phone;
  }

  @computed
  String get getPhone {
    return this._phone;
  }

  bool get phoneValid {
    return _phone != null && _phone.length >= 14;
  }

  @computed
  String get phoneErro {
    if (_phone == null || phoneValid)
      return null;
    else if (_phone.isEmpty)
      return "Campo obrigatório";
    else
      return "Celular inválido";
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
    return _senha != null && _senha.length >= 6;
  }

  @computed
  String get senhaErro {
    if (_senha == null || senhaValid)
      return null;
    else if (_senha.isEmpty)
      return "Campo obrigatório";
    else
      return "Senha muito curta";
  }

  /// Validar dados da confirmação da senha
  @action
  void setConfirSenha(String confirSenha) {
    this._confirSenha = confirSenha;
  }

  @computed
  String get getConfirSenha {
    return this._confirSenha;
  }

  bool get confirSenhaValid {
    return _confirSenha != null && _confirSenha == _senha;
  }

  @computed
  String get confirSenhaErro {
    if (_confirSenha == null || confirSenhaValid)
      return null;
    else
      return "Senha não coincidem";
  }

  @computed
  bool get isFormValid {
    return nomeValid &&
        emailValid &&
        phoneValid &&
        senhaValid &&
        confirSenhaValid;
  }

  @computed
  Function get signUpPressed {
    return (isFormValid && !_loading) ? signUp : null;
  }

  @action
  Future<void> signUp() async {
    _loading = true;

    /*Criar um novo usuário*/
    final userModel =
        UserModel(nome: _nome, email: _email, senha: _senha, phone: _phone);

    try {
      /*Chamar o uma instância do repositorio*/
      final user = await UserRepository().signUp(userModel);
      GetIt.I<UserManagerStore>().setUser(user);
    } catch (e) {
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
}
