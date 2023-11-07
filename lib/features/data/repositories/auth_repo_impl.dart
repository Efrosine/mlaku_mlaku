import 'package:firebase_auth/firebase_auth.dart';
import 'package:mlaku_mlaku/core/datastate/datastate.dart';
import 'package:mlaku_mlaku/features/data/model/user_model.dart';
import 'package:mlaku_mlaku/features/domain/entities/user_ent.dart';
import 'package:mlaku_mlaku/features/domain/repositories/auth_repo.dart';

import '../datasources/firebase/auth_service.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthService _service;

  AuthRepoImpl(this._service);
  @override
  Future<DataState<UserEntity>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignedIn() {
    // TODO: implement isSignedIn
    throw UnimplementedError();
  }

  @override
  Future<DataState<UserEntity>> signIn(UserEntity user) async {
    try {
      final result = await _service.signIn(UserModel.fromEntity(user));
      return DataSuccess(UserEntity(
          name: result.user!.displayName,
          email: result.user!.email,
          phone: result.user!.phoneNumber,
          photo: result.user!.photoURL));
    } on FirebaseAuthException catch (e) {
      return DataError(e);
    }
  }

  @override
  Future<void> signOut() {
    return _service.signOut();
  }

  @override
  Future<DataState<UserEntity>> signUp(UserEntity user) async {
    try {
      final result = await _service.signUp(UserModel.fromEntity(user));
      return DataSuccess(UserEntity(
          name: result.user!.displayName,
          email: result.user!.email,
          phone: result.user!.phoneNumber,
          photo: result.user!.photoURL));
    } on FirebaseAuthException catch (e) {
      return DataError(e);
    }
  }
}
