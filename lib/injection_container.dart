import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mlaku_mlaku/features/data/datasources/firebase/auth_service.dart';
import 'package:mlaku_mlaku/features/data/datasources/firebase/geo_service.dart';
import 'package:mlaku_mlaku/features/data/repositories/auth_repo_impl.dart';
import 'package:mlaku_mlaku/features/data/repositories/geo_repo_impl.dart';
import 'package:mlaku_mlaku/features/domain/repositories/auth_repo.dart';
import 'package:mlaku_mlaku/features/domain/repositories/geo_repo.dart';
import 'package:mlaku_mlaku/features/domain/usecases/auth_usecase.dart';
import 'package:mlaku_mlaku/features/domain/usecases/geo_usecase.dart';
import 'package:mlaku_mlaku/features/presentation/bloc/auth/auth_bloc_bloc.dart';
import 'package:mlaku_mlaku/features/presentation/bloc/booking/booking_hotels_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initDepedencies() async {
  final auth = FirebaseAuth.instance;
  final pref = await SharedPreferences.getInstance();
  final dio = Dio();

  sl
    //service
    ..registerSingleton(AuthService(auth, pref))
    ..registerSingleton(GeoService(dio))
    //repo
    ..registerSingleton<AuthRepo>(AuthRepoImpl(sl()))
    ..registerSingleton<GeoRepo>(GeoRepoImpl(sl()))
    //usecase auth
    ..registerSingleton<LogInUseCase>(LogInUseCase(sl()))
    ..registerSingleton<SignUpUseCase>(SignUpUseCase(sl()))
    ..registerSingleton<LogOutUseCase>(LogOutUseCase(sl()))
    ..registerSingleton<AuthCheckUseCase>(AuthCheckUseCase(sl()))
    ..registerSingleton<LoginCheckUseCase>(LoginCheckUseCase(sl()))

    //usecase booking
    ..registerSingleton<GetProvUseCase>(GetProvUseCase(geoRepo: sl()))
    ..registerSingleton<GetCityUseCase>(GetCityUseCase(geoRepo: sl()))
    //bloc
    ..registerFactory<BookingHotelsBloc>(() => BookingHotelsBloc(sl(), sl()))
    ..registerFactory<AuthBlocBloc>(() => AuthBlocBloc(sl(), sl(), sl(), sl(), sl()));
}
