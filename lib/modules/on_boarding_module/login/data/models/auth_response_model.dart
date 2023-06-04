// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AuthResponseModel {
  final String accessToken;
  final int expiresIn;
  final String tokenType;
  final String refreshToken;

  AuthResponseModel({
    required this.accessToken,
    required this.expiresIn,
    required this.tokenType,
    required this.refreshToken,
  });

  AuthResponseModel copyWith({
    String? accessToken,
    int? expiresIn,
    String? tokenType,
    String? refreshToken,
  }) {
    return AuthResponseModel(
      accessToken: accessToken ?? this.accessToken,
      expiresIn: expiresIn ?? this.expiresIn,
      tokenType: tokenType ?? this.tokenType,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access_token': accessToken,
      'expires_in': expiresIn,
      'token_type': tokenType,
      'refresh_token': refreshToken,
    };
  }

  factory AuthResponseModel.fromMap(Map<String, dynamic> map) {
    return AuthResponseModel(
      accessToken: map['access_token'] as String,
      expiresIn: map['expires_in'] as int,
      tokenType: map['token_type'] as String,
      refreshToken: map['refresh_token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromJson(String source) =>
      AuthResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AuthResponseModel(access_token: $accessToken, expires_in: $expiresIn, token_type: $tokenType, refresh_token: $refreshToken)';
  }

  @override
  bool operator ==(covariant AuthResponseModel other) {
    if (identical(this, other)) return true;

    return other.accessToken == accessToken &&
        other.expiresIn == expiresIn &&
        other.tokenType == tokenType &&
        other.refreshToken == refreshToken;
  }

  @override
  int get hashCode {
    return accessToken.hashCode ^
        expiresIn.hashCode ^
        tokenType.hashCode ^
        refreshToken.hashCode;
  }
}
