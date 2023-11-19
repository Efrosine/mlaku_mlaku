import 'package:flutter/material.dart';
import 'package:mlaku_mlaku/features/presentation/pages/home/booking_hotels_page.dart';

import '../../features/presentation/pages/auth_page.dart';
import '../../features/presentation/pages/nav_bar.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(AuthPage());
      case '/main':
        return _materialRoute(Navbar());
      case '/BHPage':
        return _materialRoute(BookingHotelsPage());
      default:
        return _materialRoute(AuthPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget views) {
    return MaterialPageRoute(builder: (_) => views);
  }
}
