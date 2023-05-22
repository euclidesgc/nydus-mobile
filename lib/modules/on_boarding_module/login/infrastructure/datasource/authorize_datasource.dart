import '../../data/models/models.dart';

abstract class AuthorizeDatasource {
  Future<AuthResponseModel> call({required AuthParamsModel authParams});
}
