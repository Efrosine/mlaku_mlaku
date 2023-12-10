import 'package:mlaku_mlaku/core/datastate/auth_exception.dart';
import 'package:mlaku_mlaku/core/datastate/datastate.dart';
import 'package:mlaku_mlaku/core/usecases/usecases.dart';
import 'package:mlaku_mlaku/features/domain/entities/user_ent.dart';
import 'package:mlaku_mlaku/features/domain/repositories/auth_repo.dart';

class SignUpUseCase extends UseCase<DataState<void, SignUpEnPException>, UserEntity> {

  final AuthRepo _repo;

  SignUpUseCase(this._repo);

  @override
  Future<DataState<void, SignUpEnPException>> call({UserEntity? params}) {
    return _repo.signUp(params!);
  }
}

class LogInUseCase extends UseCase<DataState<void, LogInEnPException>, UserEntity> {
  final AuthRepo _repo;

  LogInUseCase(this._repo);

  @override
  Future<DataState<void, LogInEnPException>> call({UserEntity? params}) {
    return _repo.logIn(params!);
  }
}

class LogOutUseCase extends UseCase<DataState<void, LogOutException>, void> {
  final AuthRepo _repo;

  LogOutUseCase(this._repo);

  @override
  Future<DataState<void, LogOutException>> call({void params}) {
    return _repo.logout();
  }
}

class AuthCheckUseCase extends UseCase<void, void> {
  final AuthRepo _repo;

  AuthCheckUseCase(this._repo);

  @override
  Future<void> call({void params}) {
    return _repo.authCheck();
  }
}

class LoginCheckUseCase extends UseCase<bool, void> {
  final AuthRepo _repo;

  LoginCheckUseCase(this._repo);

  @override
  Future<bool> call({void params}) {
    return _repo.loginCheck();
  }
}

class EntryDataUseCase extends UseCase<void, UserEntity> {
  final AuthRepo _repo;

  EntryDataUseCase(this._repo);

  @override
  Future<void> call({UserEntity? params}) {
    return _repo.entryDataUser(params!);


  }
}
