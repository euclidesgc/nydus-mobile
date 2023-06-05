import '../../data/models/profile_model.dart';

abstract interface class GetProfileDatasource {
  Future<ProfileModel> call();
}
