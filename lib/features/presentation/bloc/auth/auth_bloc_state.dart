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
  final String? errorCode;
  const AuthBlocActionState({this.errorCode});
}

final class AuthBlocInitial extends AuthBlocState {}

class AuthBlocStateSignIn extends AuthBlocState {}

class AuthBlocStateSignUp extends AuthBlocState {}

class AuthBlocStateDone extends AuthBlocActionState {
  const AuthBlocStateDone();
}

class AuthBlocStateError extends AuthBlocActionState {
  const AuthBlocStateError(String errorCode) : super(errorCode: errorCode);
}
