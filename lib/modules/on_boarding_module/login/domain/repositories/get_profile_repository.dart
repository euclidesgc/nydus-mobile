import '../../../../shared/src/entities/profile_entity.dart';

abstract interface class GetProfileRepository {
  Future<ProfileEntity> call();
}
