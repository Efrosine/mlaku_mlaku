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
  AuthBlocBloc(
    this._logInUseCase,
    this._signUpUseCase,
    this._authCheckUseCase,
    this._loginCheckUseCase,
    this._logOutUseCase,

    this._entryDataUseCase,

  ) : super(AuthBlocInitial()) {
    on<AuthBlocEventInit>(_init);
    on<AuthBlocEventChangeAuth>(_changeAuth);
    on<AuthBlocEventLogIn>(_logIn);
    on<AuthBlocEventSignUp>(_signUp);
    on<AuthBlocEventLogout>(_logOut);

    on<AuthBlocEventEntryDataUser>(_entryDataUser);

  }

  bool isLogin = true;

  final AuthCheckUseCase _authCheckUseCase;
  final LogInUseCase _logInUseCase;
  final LoginCheckUseCase _loginCheckUseCase;
  final SignUpUseCase _signUpUseCase;
  final LogOutUseCase _logOutUseCase;

  final EntryDataUseCase _entryDataUseCase;


  FutureOr<void> _changeAuth(AuthBlocEventChangeAuth event, Emitter<AuthBlocState> emit) {
    if (isLogin) {
      isLogin = false;
      emit(AuthBlocStateSignIn());
    } else {
      isLogin = true;
      emit(AuthBlocStateSignUp());
    }
  }

  FutureOr<void> _logIn(AuthBlocEventLogIn event, Emitter<AuthBlocState> emit) async {
    await _logInUseCase(params: event.user).then((dataState) {
      if (dataState is DataSuccess) {
        emit(AuthBlocStateDone());
      } else if (dataState is DataError) {
        emit(AuthBlocStateError(dataState.exception!.message));
      }
    });
  }

  FutureOr<void> _signUp(AuthBlocEventSignUp event, Emitter<AuthBlocState> emit) async {
    await _signUpUseCase(params: event.user).then((dataState) {
      if (dataState is DataSuccess) {

        emit(AuthBlocUserEntryDataState(user: event.user!));

      } else if (dataState is DataError) {
        emit(AuthBlocStateError(dataState.exception!.message));
      }
    });
  }

  FutureOr<void> _init(AuthBlocEventInit event, Emitter<AuthBlocState> emit) {
    _authCheckUseCase();
    _loginCheckUseCase().then((value) {
      if (value) {
        emit(AuthBlocStateDone());
      } else {
        emit(AuthBlocStateSignIn());
      }
    });
  }

  FutureOr<void> _logOut(AuthBlocEventLogout event, Emitter<AuthBlocState> emit) async {
    final result = await _logOutUseCase();
    if (result is DataSuccess) emit(AuthBlocStateSignIn());
  }


  FutureOr<void> _entryDataUser(
      AuthBlocEventEntryDataUser event, Emitter<AuthBlocState> emit) async {
    await _entryDataUseCase(params: event.user);
    emit(AuthBlocStateDone());
  }

}
