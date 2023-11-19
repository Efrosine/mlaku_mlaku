import 'package:firebase_auth/firebase_auth.dart';
import 'package:mlaku_mlaku/core/datastate/auth_exception.dart';
import 'package:mlaku_mlaku/core/datastate/datastate.dart';
import 'package:mlaku_mlaku/features/data/model/user_model.dart';
import 'package:mlaku_mlaku/features/domain/entities/user_ent.dart';
import 'package:mlaku_mlaku/features/domain/repositories/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../datasources/firebase/auth_service.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthService _service;

  AuthRepoImpl(this._service);

  @override
  Future<DataState<void, LogInEnPException>> logIn(UserEntity user) async {
    try {
      await _service.signIn(UserModel.fromEntity(user));
      return const DataSuccess(null);
    } on FirebaseAuthException catch (e) {
      return DataError(LogInEnPException.fromCode(e.code));
    } catch (e) {
      return DataError(LogInEnPException());
    }
  }

  @override
  Future<DataState<void, LogOutException>> logout() async {
    try {
      await _service.signOut();
      return DataSuccess(null);
    } catch (e) {
      return DataError(LogOutException());
    }
  }

  @override
  Future<DataState<void, SignUpEnPException>> signUp(UserEntity user) async {
    try {
      await _service.signUp(UserModel.fromEntity(user));
      return const DataSuccess(null);
    } on FirebaseAuthException catch (e) {
      return DataError(SignUpEnPException.fromCode(e.code));
    } catch (e) {
      return DataError(SignUpEnPException());
    }
  }

  @override
  Future<void> authCheck() {
    return _service.authCheck();
  }

  @override
  Future<bool> loginCheck() {
    return _service.getUserId() == null ? Future.value(false) : Future.value(true);
  }
}
