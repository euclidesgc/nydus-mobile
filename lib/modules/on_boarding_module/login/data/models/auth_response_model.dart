import 'dart:convert';

class AuthResponseModel {
  final String? accessToken;
  final int? expires;
  final String? refreshToken;

  AuthResponseModel({
    this.accessToken,
    this.expires,
    this.refreshToken,
  });

  AuthResponseModel.empty({
    this.accessToken = '',
    this.expires = 0,
    this.refreshToken = '',
  });

  AuthResponseModel copyWith({
    String? accessToken,
    int? expires,
    String? refreshToken,
  }) {
    return AuthResponseModel(
      accessToken: accessToken ?? this.accessToken,
      expires: expires ?? this.expires,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (accessToken != null) {
      result.addAll({'access_token': accessToken});
    }
    if (expires != null) {
      result.addAll({'expires': expires});
    }
    if (refreshToken != null) {
      result.addAll({'refresh_token': refreshToken});
    }

    return result;
  }

  factory AuthResponseModel.fromMap(Map<String, dynamic> map) {
    return AuthResponseModel(
      accessToken: map['access_token'],
      expires: map['expires']?.toInt(),
      refreshToken: map['refresh_token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromJson(String source) =>
      AuthResponseModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AuthResponseModel(access_token: $accessToken, expires: $expires, refresh_token: $refreshToken)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthResponseModel &&
        other.accessToken == accessToken &&
        other.expires == expires &&
        other.refreshToken == refreshToken;
  }

  @override
  int get hashCode =>
      accessToken.hashCode ^ expires.hashCode ^ refreshToken.hashCode;
}
