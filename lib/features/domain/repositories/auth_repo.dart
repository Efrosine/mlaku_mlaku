import 'package:firebase_auth/firebase_auth.dart';
import 'package:mlaku_mlaku/core/datastate/datastate.dart';
import 'package:mlaku_mlaku/features/domain/entities/user_ent.dart';

abstract class AuthRepo {
  Future<DataState<UserEntity, FirebaseAuthException>> signIn(UserEntity user);
  Future<DataState<UserEntity, FirebaseAuthException>> signUp(UserEntity user);
  Future<void> signOut();
  Future<DataState<UserEntity, FirebaseAuthException>> getCurrentUser();
  Future<bool> isSignedIn();
}
