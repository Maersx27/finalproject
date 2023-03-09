import 'package:finalpro/view/main/latihan_soal/home_page.dart';
import 'package:finalpro/view/main/latihan_soal/paket_soal_page.dart';
import 'package:flutter/material.dart';

class MapelPage extends StatelessWidget {
  const MapelPage({super.key});
  static String route = "mapel_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Mata Pelajaran"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: ListView.builder(itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(PaketSoalPage.route);
              },
              child: MapelWidget());
        }),
      ),
    );
  }
}
