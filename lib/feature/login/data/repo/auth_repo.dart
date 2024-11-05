//! auth repostriy- outline the possible auth opertion for this app

import 'package:attendance/feature/login/data/models/app_user.dart';

abstract class AuthRepo {
  Future<AppUser?> signInWithEmailAndPassword(String email, String password);

  Future<AppUser?> registerWithEmallPassWord(
      String name, String email, String password);

  Future<void> logout();

  Future<AppUser?> getcurrrentUser();
}
