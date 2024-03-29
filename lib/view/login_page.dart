import 'package:finalpro/constants/R/assets.dart';
import 'package:finalpro/view/registration_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constants/r.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String route = "login_screen";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F3F5),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                R.strings.login,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 20),
            Image.asset(R.assets.imgLogin),
            SizedBox(height: 35),
            Text(
              R.strings.welcome,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              R.strings.loginDesciprion,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins().copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: R.colors.greySubtitle,
              ),
            ),
            Spacer(),
            ButtonLogin(
              onTap: () async {
                await signInWithGoogle();
                final user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  Navigator.of(context).pushNamed(RegistrationPage.route);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Gagal Masuk"),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
              backgroundColor: Colors.white,
              borderColor: R.colors.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(R.assets.icGoogle),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    R.strings.loginWithGoogle,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: R.colors.blackLogin,
                    ),
                  ),
                ],
              ),
            ),
            ButtonLogin(
              onTap: () {
                Navigator.of(context).pushNamed(RegistrationPage.route);
              },
              backgroundColor: Colors.black,
              borderColor: R.colors.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(R.assets.icApple),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    R.strings.loginWithApple,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    super.key,
    required this.backgroundColor,
    required this.child,
    required this.borderColor,
    required this.onTap,
  });
  final Color backgroundColor;
  final Widget child;
  final Color borderColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(color: backgroundColor),
          ),
          fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
        ),
        onPressed: onTap,
        child: child,
      ),
    );
  }
}

// appBar: AppBar(
//   leading: Icon(Icons.home),
//   title: Text("Halaman Login"),
// ),
// body: Column(
//   crossAxisAlignment: CrossAxisAlignment.stretch,
//   children: [
//     Container(
//       child: ElevatedButton(
//         onPressed: () {
//           Navigator.of(context).pushNamed(RegistrationPage.route);
//         },
//         child: Text("Registration"),
//       ),
//     ),
// Container(
//   child: ElevatedButton(
//     onPressed: () {
//       // Navigator.of(context).pushNamed(RegistrationPage.route);
//     },
//     child: Text("Home"),
//   ),
// ),
// Container(
//   child: ElevatedButton(
//     onPressed: () {
//       // Navigator.of(context).pushNamed(RegistrationPage.route);
//     },
//     child: Text("Mapel"),
//   ),
// ),
// Container(
//   child: ElevatedButton(
//     onPressed: () {
//       // Navigator.of(context).pushNamed(RegistrationPage.route);
//     },
//     child: Text("Paket Soal"),
//   ),
// ),
// Container(
//   child: ElevatedButton(
//     onPressed: () {
//       // Navigator.of(context).pushNamed(RegistrationPage.route);
//     },
//     child: Text("Negative"),
//   ),
// ),
// Container(
//   child: ElevatedButton(
//     onPressed: () {
//       // Navigator.of(context).pushNamed(RegistrationPage.route);
//     },
//     child: Text("Kerjakan Soal"),
//   ),
// ),
// Container(
//   child: ElevatedButton(
//     onPressed: () {
//       // Navigator.of(context).pushNamed(RegistrationPage.route);
//     },
//     child: Text("Hasil"),
//   ),
// ),
// Container(
//   child: ElevatedButton(
//     onPressed: () {
//       // Navigator.of(context).pushNamed(RegistrationPage.route);
//     },
//     child: Text("Diskusi"),
//   ),
// ),
// Container(
//   child: ElevatedButton(
//     onPressed: () {
//       // Navigator.of(context).pushNamed(RegistrationPage.route);
//     },
//     child: Text("Profile"),
//   ),
// ),
// Container(
//   child: ElevatedButton(
//     onPressed: () {
//       // Navigator.of(context).pushNamed(RegistrationPage.route);
//     },
//     child: Text("Edit Profile"),
//   ),
// ),
//     ],
//   ),
// );
