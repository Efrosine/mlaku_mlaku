import 'package:mlaku_mlaku/core/datastate/datastate.dart';
import 'package:mlaku_mlaku/features/domain/entities/user_ent.dart';

import '../../../core/datastate/auth_exception.dart';

abstract class AuthRepo {
  Future<DataState<void, SignUpEnPException>> signUp(UserEntity user);
  Future<DataState<void, LogInEnPException>> logIn(UserEntity user);

  Future<DataState<void, LogOutException>> logout();
  Future<void> authCheck();
  Future<bool> loginCheck();
  Future<void> entryDataUser(UserEntity user);
}
