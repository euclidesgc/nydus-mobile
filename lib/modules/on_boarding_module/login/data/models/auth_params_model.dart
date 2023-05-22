class AuthParamsModel {
  final String login;
  final String password;

  const AuthParamsModel({
    required this.login,
    required this.password,
  });

  @override
  String toString() => 'AuthParamsModel(login: $login, password: $password)';

  @override
  bool operator ==(covariant AuthParamsModel other) {
    if (identical(this, other)) return true;

    return other.login == login && other.password == password;
  }

  @override
  int get hashCode => login.hashCode ^ password.hashCode;
}
