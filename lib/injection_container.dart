import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mlaku_mlaku/features/data/datasources/firebase/auth_service.dart';
import 'package:mlaku_mlaku/features/data/datasources/api/geo_service.dart';
import 'package:mlaku_mlaku/features/data/repositories/auth_repo_impl.dart';
import 'package:mlaku_mlaku/features/data/repositories/booking_hotels_repo_impl.dart';
import 'package:mlaku_mlaku/features/data/repositories/geo_repo_impl.dart';
import 'package:mlaku_mlaku/features/domain/repositories/auth_repo.dart';
import 'package:mlaku_mlaku/features/domain/repositories/booking_hotels_repo.dart';
import 'package:mlaku_mlaku/features/domain/repositories/geo_repo.dart';
import 'package:mlaku_mlaku/features/domain/usecases/auth_usecase.dart';
import 'package:mlaku_mlaku/features/domain/usecases/booking_hotels_usecase.dart';
import 'package:mlaku_mlaku/features/domain/usecases/geo_usecase.dart';
import 'package:mlaku_mlaku/features/presentation/bloc/auth/auth_bloc_bloc.dart';
import 'package:mlaku_mlaku/features/presentation/bloc/booking/booking_hotels_bloc.dart';
import 'package:mlaku_mlaku/features/presentation/bloc/geo/geo_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/data/datasources/api/booking_hotels_service.dart';
import 'features/data/datasources/firebase/cloud_service.dart';

final sl = GetIt.instance;

Future<void> initDepedencies() async {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final dio = Dio();
  final pref = await SharedPreferences.getInstance();

  sl
    //service
    ..registerSingleton<AuthService>(AuthService(auth, pref))
    ..registerSingleton<GeoService>(GeoService(dio))
    ..registerSingleton<CloudService>(CloudService(db, pref))
    ..registerSingleton<BookingHotelsService>(BookingHotelsService(dio))
    //repo
    ..registerSingleton<AuthRepo>(AuthRepoImpl(sl(), sl()))
    ..registerSingleton<GeoRepo>(GeoRepoImpl(sl()))
    ..registerSingleton<BookingHotelsRepo>(BookingHotelsRepoImpl(sl(), sl()))
    //usecase auth
    ..registerSingleton<LogInUseCase>(LogInUseCase(sl()))
    ..registerSingleton<SignUpUseCase>(SignUpUseCase(sl()))
    ..registerSingleton<LogOutUseCase>(LogOutUseCase(sl()))
    ..registerSingleton<AuthCheckUseCase>(AuthCheckUseCase(sl()))
    ..registerSingleton<LoginCheckUseCase>(LoginCheckUseCase(sl()))
    ..registerSingleton<EntryDataUseCase>(EntryDataUseCase(sl()))

    //usecase booking
    ..registerSingleton<GetProvUseCase>(GetProvUseCase(geoRepo: sl()))
    ..registerSingleton<GetCityUseCase>(GetCityUseCase(geoRepo: sl()))
    ..registerSingleton<GetListHotelsUseCase>(GetListHotelsUseCase(repo: sl()))
    ..registerSingleton<GetDetailHotelsUseCase>(GetDetailHotelsUseCase(repo: sl()))
    ..registerSingleton<SetReservationUseCase>(SetReservationUseCase(repo: sl()))
    ..registerSingleton<GetAllReservationUseCase>(GetAllReservationUseCase(repo: sl()))
    //bloc
    ..registerFactory<GeoBloc>(() => GeoBloc(sl(), sl()))
    ..registerFactory<BookingHotelsBloc>(() => BookingHotelsBloc(sl(), sl(), sl(), sl()))
    ..registerFactory<AuthBlocBloc>(
        () => AuthBlocBloc(sl(), sl(), sl(), sl(), sl(), sl()));
}
