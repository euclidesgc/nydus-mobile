class AuthParamsEntity {
  final String email;
  final String password;

  AuthParamsEntity({
    required this.email,
    required this.password,
  });

  @override
  String toString() => 'AuthParamsEntity(email: $email, password: $password)';

  @override
  bool operator ==(covariant AuthParamsEntity other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
