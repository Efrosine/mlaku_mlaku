import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mlaku_mlaku/features/data/datasources/firebase/auth_service.dart';
import 'package:mlaku_mlaku/features/data/repositories/auth_repo_impl.dart';
import 'package:mlaku_mlaku/features/domain/repositories/auth_repo.dart';
import 'package:mlaku_mlaku/features/domain/usecases/auth_usecase.dart';
import 'package:mlaku_mlaku/features/presentation/bloc/auth/auth_bloc_bloc.dart';

final sl = GetIt.instance;

Future<void> initDepedencies() async {
  final auth = FirebaseAuth.instance;
  sl
    ..registerSingleton(AuthService(auth))
    ..registerSingleton<AuthRepo>(AuthRepoImpl(sl()))
    ..registerSingleton<SignInUseCase>(SignInUseCase(sl()))
    ..registerSingleton<SignUpUseCase>(SignUpUseCase(sl()))
    ..registerFactory<AuthBlocBloc>(() => AuthBlocBloc(sl(), sl()));
}
