import 'package:finalpro/constants/r.dart';
import 'package:flutter/material.dart';

class PaketSoalPage extends StatefulWidget {
  const PaketSoalPage({super.key});
  static String route = "paket_soal_page";

  @override
  State<PaketSoalPage> createState() => _PaketSoalPageState();
}

class _PaketSoalPageState extends State<PaketSoalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.grey,
      appBar: AppBar(
        title: Text('Paket Soal'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pilih Paket Soal",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 4 / 2,
                children: [
                  PaketSoalWidget(),
                  PaketSoalWidget(),
                  PaketSoalWidget(),
                  PaketSoalWidget(),
                  PaketSoalWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaketSoalWidget extends StatelessWidget {
  const PaketSoalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      // margin: const EdgeInsets.all(13.0),
      padding: const EdgeInsets.all(13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue.withOpacity(0.2),
            ),
            padding: EdgeInsets.symmetric(),
            child: Image.asset(
              R.assets.icNote,
              width: 14,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "Aljabar",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "0/0 Paket Soal",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 9,
              color: R.colors.greySubtitleHome,
            ),
          ),
        ],
      ),
    );
  }
}
