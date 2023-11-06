import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlaku_mlaku/config/route/route.dart';
import 'package:mlaku_mlaku/features/presentation/bloc/auth/auth_bloc_bloc.dart';
import 'package:mlaku_mlaku/features/presentation/pages/auth_page.dart';
import 'package:mlaku_mlaku/firebase_options.dart';
import 'package:mlaku_mlaku/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initDepedencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBlocBloc>(
      create: (context) => sl()..add(AuthBlocEventChangeAuth()),
      child: MaterialApp(
        onGenerateRoute: AppRoute.onGenerateRoute,
        initialRoute: '/',
      ),
    );
  }
}
