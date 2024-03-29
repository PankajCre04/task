import 'package:flutter/material.dart';
import 'package:task/route_generator.dart';
import 'package:task/screens/home_screen.dart';
import 'package:task/screens/spend_screen.dart';
import 'package:task/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
