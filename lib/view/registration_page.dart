import 'package:finalpro/view/main_page.dart';
import 'package:flutter/material.dart';

import '../constants/r.dart';
import 'login_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});
  static const String route = "registration_page";

  @override
  State<RegistrationPage> createState() => _MyWidgetState();
}

enum Gender { lakilaki, perempuan }

class _MyWidgetState extends State<RegistrationPage> {
  String gender = "Laki-Laki";
  List<String> classSlta = ["10", "11", "12"];
  String selectedClass = "10";

  final emailController = TextEditingController();

  onTapGender(Gender genderInput) {
    if (genderInput == Gender.lakilaki) {
      gender = "Laki-Laki";
    } else {
      gender = "Perempuan";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Halaman Registrasi",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: SafeArea(
          child: ButtonLogin(
            onTap: () {
              print(emailController.text);
              Navigator.of(context).pushNamed(MainPage.route);
            },
            backgroundColor: R.colors.primary,
            borderColor: R.colors.primary,
            child: Text(
              R.strings.daftar,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegisterTextField(
                title: 'Nama Lengkap',
                hintText: 'nama',
              ),
              RegisterTextField(
                controller: emailController,
                title: 'Alamat Email',
                hintText: 'email',
              ),
              SizedBox(height: 5),
              Text(
                "Jenis Kelamin",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: gender == "Laki-Laki"
                              ? R.colors.primary
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              width: 1,
                              color: R.colors.greyBorder,
                            ),
                          ),
                        ),
                        onPressed: () {
                          onTapGender(Gender.lakilaki);
                        },
                        child: Text(
                          "Laki - Laki",
                          style: TextStyle(
                            fontSize: 14,
                            color: gender == "Laki-Laki"
                                ? Colors.white
                                : Color(0xff282828),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: gender == "Perempuan"
                              ? R.colors.primary
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              width: 1,
                              color: R.colors.greyBorder,
                            ),
                          ),
                        ),
                        onPressed: () {
                          onTapGender(Gender.perempuan);
                        },
                        child: Text(
                          "Perempuan",
                          style: TextStyle(
                            fontSize: 14,
                            color: gender == "Perempuan"
                                ? Colors.white
                                : Color(0xff282828),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                "Kelas",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  border: Border.all(color: R.colors.greyBorder),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      value: selectedClass,
                      items: classSlta
                          .map(
                            (e) => DropdownMenuItem<String>(
                              child: Text(e),
                              value: e,
                            ),
                          )
                          .toList(),
                      onChanged: (String? val) {
                        selectedClass = val!;
                        setState(() {});
                      }),
                ),
              ),
              SizedBox(height: 5),
              RegisterTextField(
                title: 'Nama Sekolah',
                hintText: 'nama sekolah',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterTextField extends StatelessWidget {
  const RegisterTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
  });
  final String title;
  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(color: R.colors.greyBorder),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: R.colors.greyHintText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
