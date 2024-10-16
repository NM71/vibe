/*

Auth Repository - outlines the possible auth operations for this app.
(No Implementation here, it will be in data layer)

 */

import 'package:vibe/features/auth/domain/entities/app_user.dart';

abstract class AuthRepo{

  Future<AppUser?> loginWithEmailPassword(String email, String password);
  Future<AppUser?> registerWithEmailPassword(String name, String email, String password);
  Future<void> logout();
  Future<AppUser?> getCurrentUser();
}