part of 'auth_bloc_bloc.dart';

sealed class AuthBlocState extends Equatable {
  final UserEntity? user;
  final FirebaseAuthException? exception;
  const AuthBlocState({
    this.user,
    this.exception,
  });

  @override
  List<Object> get props => [];
}

sealed class AuthBlocActionState extends AuthBlocState {
  const AuthBlocActionState({
    UserEntity? user,
    FirebaseAuthException? exception,
  }) : super(user: user, exception: exception);
}

final class AuthBlocInitial extends AuthBlocState {}

class AuthBlocStateSignIn extends AuthBlocState {}

class AuthBlocStateSignUp extends AuthBlocState {}

class AuthBlocStateDone extends AuthBlocActionState {
  const AuthBlocStateDone(UserEntity user) : super(user: user);
}

class AuthBlocStateError extends AuthBlocActionState {
  const AuthBlocStateError(FirebaseAuthException exception) : super(exception: exception);
}
