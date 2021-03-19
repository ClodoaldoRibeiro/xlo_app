import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'package:xlo_app/helper/extension.dart';
import 'package:xlo_app/repositories/user_repository.dart';
import 'package:xlo_app/stores/user_manager_store.dart';

part 'retrieve_store.g.dart';

class RetrieveStore = _RetrieveStore with _$RetrieveStore;

abstract class _RetrieveStore with Store {
  @observable
  String _email = "";

  @observable
  bool _loading = false;

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

  @computed
  bool get getLoading {
    return _loading;
  }

  bool get emailValid {
    return _email.isNotEmpty && _email.isEmailValid();
  }

  @computed
  String get emailErro {
    if (_email.isEmpty || emailValid)
      return null;
    else
      return "E-mail inválido";
  }

  @computed
  String get getErro {
    return this._erro;
  }

  @action
  Future<void> recuperarSenha() async {
    _loading = true;

    try {
      final user = await UserRepository().doUserResetPassword(_email.trim());
      // GetIt.I<UserManagerStore>().setUser(user);
    } catch (e) {
      _erro = e;
    }

    _loading = false;
  }
}
