import '../entities/entities.dart';

abstract interface class AuthorizeRepository {
  Future<AuthResponseEntity> call({required AuthParamsEntity authParams});
}
