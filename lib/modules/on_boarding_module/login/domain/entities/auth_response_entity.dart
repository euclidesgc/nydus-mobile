import 'dart:convert';

class AuthResponseEntity {
  final String accessToken;
  final int expireIn;
  final String tokenType;
  final String refreshToken;

  AuthResponseEntity({
    required this.accessToken,
    required this.expireIn,
    required this.tokenType,
    required this.refreshToken,
  });

  AuthResponseEntity copyWith({
    String? accessToken,
    int? expireIn,
    String? tokenType,
    String? refreshToken,
  }) {
    return AuthResponseEntity(
      accessToken: accessToken ?? this.accessToken,
      expireIn: expireIn ?? this.expireIn,
      tokenType: tokenType ?? this.tokenType,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access_token': accessToken,
      'expire_in': expireIn,
      'token_type': tokenType,
      'refresh_token': refreshToken,
    };
  }

  factory AuthResponseEntity.fromMap(Map<String, dynamic> map) {
    return AuthResponseEntity(
      accessToken: map['access_token'] as String,
      expireIn: map['expire_in'] as int,
      tokenType: map['token_type'] as String,
      refreshToken: map['refresh_token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResponseEntity.fromJson(String source) =>
      AuthResponseEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AuthResponseEntity(access_token: $accessToken, expire_in: $expireIn, token_type: $tokenType, refresh_token: $refreshToken)';
  }

  @override
  bool operator ==(covariant AuthResponseEntity other) {
    if (identical(this, other)) return true;

    return other.accessToken == accessToken &&
        other.expireIn == expireIn &&
        other.tokenType == tokenType &&
        other.refreshToken == refreshToken;
  }

  @override
  int get hashCode {
    return accessToken.hashCode ^
        expireIn.hashCode ^
        tokenType.hashCode ^
        refreshToken.hashCode;
  }
}
