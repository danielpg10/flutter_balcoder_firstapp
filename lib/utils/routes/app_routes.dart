import 'package:balcoder_flutter/ui/home/home_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/';
  static const String form = '/userPage';
  static const String login = '/login';
  static const String register = '/register';
  
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const MyHomePage());
      case form:
        return MaterialPageRoute(builder: (context) => const MyHomePage());
      case login:
        return MaterialPageRoute(builder: (context) => const MyHomePage());
      case register:
        return MaterialPageRoute(builder: (context) => const MyHomePage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  } 
}
