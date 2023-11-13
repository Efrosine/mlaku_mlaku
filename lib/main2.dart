import 'package:flutter/material.dart';
import 'package:mlaku_mlaku/features/presentation/pages/home/booking_hotels_page.dart';

void main() {
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
