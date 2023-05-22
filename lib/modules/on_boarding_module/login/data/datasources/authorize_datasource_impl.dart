import 'dart:convert';
import 'dart:developer';

import 'package:package_manager/package_manager.dart';

import '../../infrastructure/datasource/authorize_datasource.dart';
import '../models/models.dart';

class AuthorizeDatasourceImpl implements AuthorizeDatasource {
  final ClientHttp clientHttp;

  AuthorizeDatasourceImpl({required this.clientHttp});

  @override
  Future<AuthResponseModel> call({required AuthParamsModel authParams}) async {
    const url = 'https://98f7-177-55-192-61.ngrok-free.app/login';

    final encodedParams = base64Encode(
      utf8.encode('${authParams.login}:${authParams.password}'),
    );

    try {
      final response = await clientHttp.request(
        url: url,
        verb: HttpVerb.POST,
        headers: {
          "Authorization": "Basic $encodedParams",
        },
      );

      final data = Map<String, dynamic>.from(response.data);
      return AuthResponseModel.fromMap(data);
    } catch (error, stack) {
      log('📛 Error: ${error.toString()}', error: error, stackTrace: stack);

      rethrow;
    }
  }
}
