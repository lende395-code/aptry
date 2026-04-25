import 'package:flutter/material.dart';
import 'screens/login_screens.dart';
import 'screens/forgot_password_screens.dart';
import 'screens/dashboard_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/forgot': (context) => ForgotPasswordScreen(),
        '/dashboard': (context) => DashboardScreen(),
      },
    );
  }
}