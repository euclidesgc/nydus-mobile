class AuthResponseEntity {
  final String accessToken;

  AuthResponseEntity({
    required this.accessToken,
  });

  @override
  String toString() => 'AuthResponseEntity(accessToken: $accessToken)';

  @override
  bool operator ==(covariant AuthResponseEntity other) {
    if (identical(this, other)) return true;

    return other.accessToken == accessToken;
  }

  @override
  int get hashCode => accessToken.hashCode;
}
