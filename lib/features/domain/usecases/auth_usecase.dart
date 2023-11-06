import '../../../core/datastate/datastate.dart';
import '../../../core/usecases/usecases.dart';
import '../entities/user_ent.dart';
import '../repositories/auth_repo.dart';

class SignInUseCase extends UseCase<DataState<UserEntity>, UserEntity> {
  final AuthRepo _repo;

  SignInUseCase(this._repo);

  @override
  Future<DataState<UserEntity>> call({UserEntity? params}) {
    return _repo.signIn(params!);
  }
}

class SignUpUseCase extends UseCase<DataState<UserEntity>, UserEntity> {
  final AuthRepo _repo;

  SignUpUseCase(this._repo);

  @override
  Future<DataState<UserEntity>> call({UserEntity? params}) {
    return _repo.signUp(params!);
  }
}

class SignOutUseCase extends UseCase<void, void> {
  final AuthRepo _repo;

  SignOutUseCase(this._repo);

  @override
  Future<void> call({void params}) {
    return _repo.signOut();
  }
}

class GetCurrentUserUseCase extends UseCase<DataState<UserEntity>, void> {
  final AuthRepo _repo;

  GetCurrentUserUseCase(this._repo);

  @override
  Future<DataState<UserEntity>> call({void params}) {
    return _repo.getCurrentUser();
  }
}

class IsSignedInUseCase extends UseCase<bool, void> {
  final AuthRepo _repo;

  IsSignedInUseCase(this._repo);

  @override
  Future<bool> call({void params}) {
    return _repo.isSignedIn();
  }
}
