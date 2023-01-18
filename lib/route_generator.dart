import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/screens/bottombar_screen.dart';
import 'package:task/screens/home_screen.dart';
import 'package:task/screens/spend_screen.dart';
import 'package:task/screens/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case BottombarScreen.routeName:
        return MaterialPageRoute(builder: (context) => BottombarScreen());
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case SpendScreen.routeName:
        return MaterialPageRoute(builder: (context) => SpendScreen());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text("Error Page"),
            ),
          );
        });
    }
  }
}
