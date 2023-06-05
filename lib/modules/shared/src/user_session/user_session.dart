import '../entities/profile_entity.dart';

class UserSession {
  static String? token;
  static String? refreshToken;
  static ProfileEntity? perfil;

  static void clear() {
    token = null;
    refreshToken = null;
    perfil = null;
  }
}
