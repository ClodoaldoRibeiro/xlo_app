/*
* Modelo de dados do usuário
* */
enum UserType { PARTICULAR, PROFESSIONAL }

class UserModel {
  UserModel(
      {this.id,
      this.nome,
      this.email,
      this.phone,
      this.senha,
      this.type = UserType.PARTICULAR,
      this.createdAt});

  String id;
  String nome;
  String email;
  String phone;
  String senha;
  UserType type;
  DateTime createdAt;

  @override
  String toString() {
    return 'UserModel{id: $id, nome: $nome, email: $email, phone: $phone, senha: $senha, type: $type, createdAt: $createdAt}';
  }
}
