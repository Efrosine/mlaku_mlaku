part of 'auth_bloc_bloc.dart';

sealed class AuthBlocEvent extends Equatable {
  AuthBlocEvent({this.user});
  final UserEntity? user;

  @override
  List<Object> get props => [];
}

class AuthBlocEventChangeAuth extends AuthBlocEvent {}

class AuthBlocEventSignIn extends AuthBlocEvent {
  AuthBlocEventSignIn(UserEntity user) : super(user: user);
}

class AuthBlocEventSignUp extends AuthBlocEvent {
  AuthBlocEventSignUp(UserEntity user) : super(user: user);
}
