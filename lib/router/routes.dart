import 'package:flutter/material.dart';
import '../screen/screens.dart';
import 'package:riot_sync/model/menuOption.dart';

class AppRoutes {
  static const initialRoute = 'choice';

  static final menuOption = <MenuOption>[
    MenuOption(
        route: 'home', icon: Icons.home, name: 'Home ', screen: HomeScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> routes = {
    'navbar': (BuildContext context) => const NavBarScreen(),
    'choice': (BuildContext context) => const ChoiceScreen(),
    'login_page': (BuildContext context) => const LoginPage(),
    'register_screen': (BuildContext context) => RegisterScreen(),
    'home_screen': (BuildContext context) => HomeScreen(),
    'juegos_screen': (BuildContext context) => const JuegosScreen(),
    'add_game_screen': (BuildContext context) => AddGameScreen(),
  };
}
