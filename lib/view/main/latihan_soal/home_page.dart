import 'package:finalpro/view/main/latihan_soal/mapel_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/r.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.grey,
      body: SafeArea(
        child: ListView(
          children: [
            _buildUserHomeProfile(),
            _buildTopBanner(context),
            _buildHomeListMapel(),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      "Terbaru",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 150,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Image.asset(
                            R.assets.imgBanner,
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 35),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildHomeListMapel() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 21,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Pilih Pelajaran",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(MapelPage.route);
                },
                child: Text(
                  "Lihat Semua",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: R.colors.primary),
                ),
              ),
            ],
          ),
          MapelWidget(),
          MapelWidget(),
          MapelWidget(),
        ],
      ),
    );
  }

  Container _buildTopBanner(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      decoration: BoxDecoration(
          color: R.colors.primary, borderRadius: BorderRadius.circular(20)),
      height: 147,
      width: double.infinity,
      child: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 15,
          ),
          child: Text(
            "Mau kerjain latihan soal apa hari ini?",
            style: GoogleFonts.poppins().copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Image.asset(
            R.assets.imgHome,
            width: MediaQuery.of(context).size.width * 0.5,
          ),
        ),
      ]),
    );
  }

  Padding _buildUserHomeProfile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hai Nama User",
                  style: GoogleFonts.poppins()
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
                ),
                Text(
                  "Selamat Datang",
                  style: GoogleFonts.poppins().copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            R.assets.icAvatar,
            width: 35,
            height: 35,
          ),
        ],
      ),
    );
  }
}

class MapelWidget extends StatelessWidget {
  const MapelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
                color: R.colors.grey, borderRadius: BorderRadius.circular(10)),
            child: Image.asset(R.assets.icAtom),
          ),
          SizedBox(
            width: 6,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Matematika",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "0/50 Paket latihan soal",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: R.colors.greySubtitleHome,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Stack(
                  children: [
                    Container(
                      height: 5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: R.colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: 5,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        color: R.colors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
