import 'dart:developer';

import 'package:package_manager/package_manager.dart';

import '../../domain/errors/errors.dart';
import '../../infrastructure/datasource/authorize_datasource.dart';
import '../models/models.dart';
import 'api_path.dart';

class AuthorizeDatasourceImpl implements AuthorizeDatasource {
  final ClientHttp clientHttp;

  AuthorizeDatasourceImpl({required this.clientHttp});

  @override
  Future<AuthResponseModel> call({required AuthParamsModel authParams}) async {
    const clientId = String.fromEnvironment('CLIENT_ID');
    const clientSecret = String.fromEnvironment('CLIENT_SECRET');
    const grantType = String.fromEnvironment('GRANT_TYPE');

    try {
      final response = await clientHttp.request(
        url: ApiPath.authorizePath,
        verb: HttpVerb.POST,
        body: FormData.fromMap({
          'client_id': clientId,
          'client_secret': clientSecret,
          'grant_type': grantType,
          'userName': authParams.login,
          'password': authParams.password,
          'idAssinatura': 395 //Deve buscar do QRCODE
        }),
      );

      final data = Map<String, dynamic>.from(response.data);
      return AuthResponseModel.fromMap(data);
    } on BadRequestError {
      throw InvalidLoginError();
    } catch (error, stack) {
      log('📛 Error', error: error, stackTrace: stack);

      rethrow;
    }
  }
}
