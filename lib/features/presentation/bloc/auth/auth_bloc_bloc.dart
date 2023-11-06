import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mlaku_mlaku/features/domain/usecases/auth_usecase.dart';

import '../../../../core/datastate/datastate.dart';
import '../../../domain/entities/user_ent.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  bool isLogin = true;

  AuthBlocBloc(
    this._signInUseCase,
    this._signUpUseCase,
  ) : super(AuthBlocInitial()) {
    on<AuthBlocEventChangeAuth>(_changeAuth);
    on<AuthBlocEventSignIn>(_signIn);
    on<AuthBlocEventSignUp>(_signUp);
  }

  FutureOr<void> _changeAuth(AuthBlocEventChangeAuth event, Emitter<AuthBlocState> emit) {
    if (isLogin) {
      isLogin = false;
      emit(AuthBlocStateSignIn());
    } else {
      isLogin = true;
      emit(AuthBlocStateSignUp());
    }
  }

  FutureOr<void> _signIn(AuthBlocEventSignIn event, Emitter<AuthBlocState> emit) async {
    await _signInUseCase(params: event.user).then((dataState) {
      if (dataState is DataSuccess && dataState.data != null) {
        emit(AuthBlocStateDone(dataState.data!));
      } else if (dataState is DataError) {
        emit(AuthBlocStateError(dataState.exception!));
      }
    });
  }

  FutureOr<void> _signUp(AuthBlocEventSignUp event, Emitter<AuthBlocState> emit) async {
    await _signUpUseCase(params: event.user).then((dataState) {
      if (dataState is DataSuccess && dataState.data != null) {
        emit(AuthBlocStateDone(dataState.data!));
      } else if (dataState is DataError) {
        emit(AuthBlocStateError(dataState.exception!));
      }
    });
  }
}
