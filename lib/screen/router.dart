import 'package:flutter/material.dart';
import 'package:helia/screen/home/home.dart';
import 'package:helia/screen/letin/let_in.dart';
import 'package:helia/screen/register/register.dart';
import 'package:helia/screen/splash_screen/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/letin':
        return MaterialPageRoute(builder: (_) => const LetIn());
      case '/home':
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      default:
        return null;
    }
  }
}
