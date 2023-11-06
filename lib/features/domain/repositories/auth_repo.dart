import 'package:mlaku_mlaku/core/datastate/datastate.dart';
import 'package:mlaku_mlaku/features/domain/entities/user_ent.dart';

abstract class AuthRepo {
  Future<DataState<UserEntity>> signIn(UserEntity user);
  Future<DataState<UserEntity>> signUp(UserEntity user);
  Future<void> signOut();
  Future<DataState<UserEntity>> getCurrentUser();
  Future<bool> isSignedIn();
}
