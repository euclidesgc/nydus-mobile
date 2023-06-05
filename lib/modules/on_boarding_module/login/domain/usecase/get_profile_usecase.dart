import 'dart:developer';

import '../../../../shared/shared.dart';
import '../repositories/get_profile_repository.dart';

class GetProfileUsecase {
  final GetProfileRepository repository;

  GetProfileUsecase({
    required this.repository,
  });

  Future<ProfileEntity> call() {
    try {
      return repository();
    } catch (error, stack) {
      log('📛 Error', error: error, stackTrace: stack);

      rethrow;
    }
  }
}
