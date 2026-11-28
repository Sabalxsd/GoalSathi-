import 'package:goalsathi/view/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:goalsathi/view/dashboard/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarThemeData(
              backgroundColor: Colors.white
          )
      ),
      home: LoginScreen(),
    );
  }
}