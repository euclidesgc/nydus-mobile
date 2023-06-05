import 'dart:developer';

import '../../../../shared/shared.dart';
import '../../domain/repositories/get_profile_repository.dart';
import '../datasource/get_profile_datasource.dart';

class GetProfileRepositoryImpl implements GetProfileRepository {
  final GetProfileDatasource datasource;

  GetProfileRepositoryImpl({required this.datasource});

  @override
  Future<ProfileEntity> call() async {
    try {
      final response = await datasource.call();

      return ProfileEntity(
        idPessoa: response.idPessoa,
        nome: response.nome,
        registros: response.registros
            .map((e) => RegisterEntity.fromMap(e.toMap()))
            .toList(),
      );
    } catch (error, stack) {
      log('📛 Error', error: error, stackTrace: stack);

      rethrow;
    }
  }
}
