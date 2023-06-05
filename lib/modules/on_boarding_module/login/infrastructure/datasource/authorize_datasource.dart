import '../../data/models/models.dart';

abstract interface class AuthorizeDatasource {
  Future<AuthResponseModel> call({required AuthParamsModel authParams});
}
