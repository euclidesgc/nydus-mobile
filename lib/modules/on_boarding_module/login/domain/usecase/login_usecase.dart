import 'dart:developer';

import 'package:flutter/foundation.dart';

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
      if (kDebugMode) {
        log('📛 Error', error: error, stackTrace: stack);
      }
      rethrow;
    }
  }
}
