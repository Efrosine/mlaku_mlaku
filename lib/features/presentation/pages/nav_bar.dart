import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'booking/booking_page.dart';
import 'home/home_page.dart';
import 'myaccount/myaccount_page.dart';
import 'saved/saved_page.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: botNavPages[tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: botNavItems,
        currentIndex: tabIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            tabIndex = index;
          });
        },
      ),
    );
  }
}

List<BottomNavigationBarItem> botNavItems = [
  BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
  BottomNavigationBarItem(icon: Icon(Icons.article_outlined), label: 'Booking'),
  BottomNavigationBarItem(icon: Icon(Icons.bookmark_outline), label: 'Saved'),
  BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'My Acount'),
];

List<Widget> botNavPages = [
  HomePage(),
  BookingPage(),
  SavedPage(),
  MyAccountPage(),
];
