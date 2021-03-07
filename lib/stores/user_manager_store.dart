import 'package:mobx/mobx.dart';
import 'package:xlo_app/models/user_model.dart';
import 'package:xlo_app/repositories/user_repository.dart';

part 'user_manager_store.g.dart';

class UserManagerStore = _UserManagerStore with _$UserManagerStore;

abstract class _UserManagerStore with Store {
  _UserManagerStore() {
    _getCurrentUser();
  }

  @observable
  UserModel userModel;

  @action
  void setUser(UserModel value) => userModel = value;

  @computed
  bool get isLoggedIn => userModel != null;

  Future<void> _getCurrentUser() async {
    final user = await UserRepository().currentUser();
    setUser(user);
  }

  Future<void> logout() async {
    await UserRepository().logout();
    setUser(null);
  }
}
