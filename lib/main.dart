import 'package:finalpro/view/login_page.dart';
import 'package:finalpro/view/main/latihan_soal/mapel_page.dart';
import 'package:finalpro/view/main/latihan_soal/paket_soal_page.dart';
import 'package:finalpro/view/main_page.dart';
import 'package:finalpro/view/registration_page.dart';
import 'package:finalpro/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/r.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Soal',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: R.colors.primary,
        ),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        //primarySwatch: Colors.blue,
        // backgroundColor: R.colors.grey,
      ),
      // home: const SplashScreen(),
      initialRoute: SplashScreen.route,
      routes: {
        SplashScreen.route: (context) => SplashScreen(),
        LoginPage.route: (context) => LoginPage(),
        RegistrationPage.route: (context) => RegistrationPage(),
        MainPage.route: (context) => MainPage(),
        PaketSoalPage.route: (context) => PaketSoalPage(),
        MapelPage.route: (context) => MapelPage(),
      },
    );
  }
}
