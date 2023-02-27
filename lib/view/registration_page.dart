import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});
  static const String route = "registration_page";

  @override
  State<RegistrationPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Halaman Registrasi"),
    );
  }
}
