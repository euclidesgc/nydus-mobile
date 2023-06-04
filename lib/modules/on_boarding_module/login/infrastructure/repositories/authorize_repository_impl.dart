import 'dart:developer';

import '../../data/models/models.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/authorize_repository.dart';
import '../datasource/authorize_datasource.dart';

class AuthorizeRepositoryImpl implements AuthorizeRepository {
  final AuthorizeDatasource authorizeDatasource;

  const AuthorizeRepositoryImpl({
    required this.authorizeDatasource,
  });

  @override
  Future<AuthResponseEntity> call({
    required AuthParamsEntity authParams,
  }) async {
    try {
      final authParamsModel = AuthParamsModel(
        login: authParams.email,
        password: authParams.password,
      );

      final response = await authorizeDatasource(authParams: authParamsModel);

      return AuthResponseEntity(
        accessToken: response.accessToken,
        expireIn: response.expiresIn,
        tokenType: response.tokenType,
        refreshToken: response.refreshToken,
      );
    } catch (error, stack) {
      log('📛 Error', error: error, stackTrace: stack);

      rethrow;
    }
  }
}
