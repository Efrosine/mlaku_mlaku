import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mlaku_mlaku/config/route/route.dart';
import 'package:mlaku_mlaku/features/presentation/bloc/auth/auth_bloc_bloc.dart';
import 'package:mlaku_mlaku/features/presentation/bloc/booking/booking_hotels_bloc.dart';
import 'package:mlaku_mlaku/features/presentation/pages/auth/auth_page.dart';
import 'package:mlaku_mlaku/firebase_options.dart';
import 'package:mlaku_mlaku/injection_container.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initDepedencies();

  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBlocBloc>(
            create: (context) => sl()..add(AuthBlocEventInit()),
          ),
          BlocProvider<BookingHotelsBloc>(
            create: (context) => sl(),
          )
        ],
        child: MaterialApp(
          color: Colors.blue,
          onGenerateRoute: AppRoute.onGenerateRoute,
          initialRoute: '/',
        ));
    // return BlocProvider<AuthBlocBloc>(
    //   create: (context) => sl()..add(AuthBlocEventInit()),
    //   child: MaterialApp(
    //     onGenerateRoute: AppRoute.onGenerateRoute,
    //     initialRoute: '/',
    //   ),
    // );
  }
}
