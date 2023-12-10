import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mlaku_mlaku/features/presentation/pages/home/booking_hotels_page.dart';

import 'firebase_options.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initDepedencies();
  runApp(TestPage());
}

class TestPage extends StatefulWidget {
  TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // home: BookingHotelsPage(),
        home: Scaffold(body: BookingHotelsPage()));
  }
}
