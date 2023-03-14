import 'dart:async';
import 'package:finalpro/view/login_page.dart';
import 'package:finalpro/view/main/latihan_soal/home_page.dart';
import 'package:finalpro/view/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants/r.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String route = "splash_screen";

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // TODO  redirect to register or home
        Navigator.of(context).pushReplacementNamed(MainPage.route);
      } else {
        Navigator.of(context).pushReplacementNamed(LoginPage.route);
      }

      //menggunakan matrial pageroute
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => LoginPage(),
      //   ),
      // );
      //------menggunakan alias name yang ada di main.dart
    });
    return Scaffold(
      backgroundColor: R.colors.primary,
      body: Center(
        child: Image.asset(R.assets.icSplash),
      ),
    );
  }
}
