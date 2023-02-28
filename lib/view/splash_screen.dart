import 'dart:async';
import 'package:finalpro/view/login_page.dart';
import 'package:flutter/material.dart';
import '../constants/r.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String route = "splash_screen";

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      //menggunakan matrial pageroute
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => LoginPage(),
      //   ),
      // );
      //------menggunakan alias name yang ada di main.dart
      Navigator.of(context).pushReplacementNamed(LoginPage.route);
    });
    return Scaffold(
      backgroundColor: R.colors.primary,
      body: Center(
        child: Image.asset(R.assets.icSplash),
      ),
    );
  }
}
