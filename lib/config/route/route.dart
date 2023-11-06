import 'package:flutter/material.dart';

import '../../features/presentation/pages/auth_page.dart';
import '../../features/presentation/pages/nav_bar.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(AuthPage());
      case '/main':
        return _materialRoute(Navbar());
      default:
        return _materialRoute(AuthPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget views) {
    return MaterialPageRoute(builder: (_) => views);
  }
}
