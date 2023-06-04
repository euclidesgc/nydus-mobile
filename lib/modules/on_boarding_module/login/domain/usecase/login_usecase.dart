import 'dart:developer';

import '../entities/entities.dart';
import '../repositories/authorize_repository.dart';

class AuthorizeUsecase {
  final AuthorizeRepository repository;

  AuthorizeUsecase({
    required this.repository,
  });

  Future<AuthResponseEntity> call({required AuthParamsEntity authParams}) {
    try {
      return repository(authParams: authParams);
    } catch (error, stack) {
      log('📛 Error', error: error, stackTrace: stack);

      rethrow;
    }
  }
}
