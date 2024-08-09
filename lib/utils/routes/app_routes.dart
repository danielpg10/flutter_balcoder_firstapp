import 'package:flutter/material.dart';
import 'package:balcoder_flutter_second/ui/home/home_page.dart';

class AppRoutes {
  static const String home = '/home_page';
  static const String login = '/login';
  static const String register = '/register';
  static const String dashboard = '/dashboard';
  static const String gallery = '/gallery';
  static const String products = '/products';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Inicio'));
      case AppRoutes.login:
        return MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Login'));
      case AppRoutes.register:
        return MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Register'));
      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Dashboard'));
      case AppRoutes.products:
        return MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Products'));
      case AppRoutes.gallery:
        return MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Gallery'));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("Esta ruta no existe en ${settings.name}"),
            ),
          ),
        );
    }
  }
}


