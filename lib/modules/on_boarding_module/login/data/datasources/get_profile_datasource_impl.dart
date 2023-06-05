import 'dart:developer';

import 'package:package_manager/package_manager.dart';

import '../../../../shared/shared.dart';
import '../../domain/errors/errors.dart';
import '../../infrastructure/datasource/get_profile_datasource.dart';
import '../models/profile_model.dart';
import 'api_path.dart';

class GetProfileDatasourceImpl implements GetProfileDatasource {
  final ClientHttp clientHttp;

  GetProfileDatasourceImpl({required this.clientHttp});

  @override
  Future<ProfileModel> call() async {
    try {
      final response = await clientHttp.request(
        url: ApiPath.profilePath,
        verb: HttpVerb.GET,
        headers: {'Authorization': 'Bearer ${UserSession.token}'},
      );

      final data = Map.from(response.data);
      return ProfileModel.fromMap(data);
    } on BadRequestError {
      throw InvalidLoginError();
    } catch (error, stack) {
      log('📛 Error', error: error, stackTrace: stack);
      rethrow;
    }
  }
}
