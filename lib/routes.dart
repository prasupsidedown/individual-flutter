import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'home.dart';
import 'halaman.dart';

class AppRoutes {
  static const login = '/login';
  static const home = '/home';
  static const halaman = '/halaman';

  static Map<String, WidgetBuilder> get routes => {
    login: (_) => const LoginPage(),
    home: (_) => const HomeScreen(),
    halaman: (_) => const MainShell(),
  };
}
