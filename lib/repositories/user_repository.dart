import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_app/models/user_model.dart';
import 'package:xlo_app/repositories/parse_errors.dart';
import 'package:xlo_app/repositories/table_keys.dart';

class UserRepository {
  /// Criar usuáriso no Parser Server
  Future<UserModel> signUp(UserModel userModel) async {
    ParseUser parseUser =
        ParseUser(userModel.email, userModel.senha, userModel.email);

    parseUser.set<String>(keyUserName, userModel.nome);
    parseUser.set<String>(keyUserPhone, userModel.phone);
    parseUser.set(keyUserType, userModel.type.index);

    final response = await parseUser.signUp();

    if (response.success) {
      return mapParseToUser(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  Future<UserModel> loginWithEmail(String email, String password) async {
    final parseruser = ParseUser(email, password, null);

    final response = await parseruser.login();

    if (response.success) {
      return mapParseToUser(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  ///Converter o usuário response para um UsuerModel do sistema.
  UserModel mapParseToUser(ParseUser parseUser) {
    return UserModel(
      id: parseUser.objectId,
      nome: parseUser.get(keyUserName),
      email: parseUser.get(keyUserEmail),
      phone: parseUser.get(keyUserPhone),
      type: UserType.values[parseUser.get(keyUserType)],
      createdAt: parseUser.get(keyUserCreatedAt),
    );
  }

  Future<UserModel> currentUser() async {
    final parseUser = await ParseUser.currentUser();
    if (parseUser != null) {
      final response =
          await ParseUser.getCurrentUserFromServer(parseUser.sessionToken);
      if (response.success) {
        return mapParseToUser(response.result);
      } else {
        await parseUser.logout();
      }
    }
    return null;
  }

  Future<void> logout() async {
    final ParseUser currentUser = await ParseUser.currentUser();
    await currentUser.logout();
  }

  Future<UserModel> doUserResetPassword(String email) async {
    final parseruser = ParseUser(null, null, email);

    final response = await parseruser.requestPasswordReset();

    if (response.success) {
      return mapParseToUser(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }
}
