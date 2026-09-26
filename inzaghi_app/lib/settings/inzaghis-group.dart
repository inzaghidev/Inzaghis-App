// about_page.dart
import 'package:flutter/material.dart';

class InzaghisGroup extends StatelessWidget {
  final List<Map<String, String>> networks = [
    {
      'title': "Inzaghi's Blog",
      'description':
          "Inzaghi's Blog merupakan Platform Blogging sebagai tempat untuk berbagi Ilmu Pengetahuan, terutama seputar IT. Inzaghi's Blog lebih menggunakan Platform Blogger, agar lebih mudah dan praktis.",
      'image': 'assets/images/inzaghis-blog-by-inzaghis-group-corp.png',
    },
    {
      'title': "Inzaghi's Sites",
      'description':
          "Inzaghi's Sites merupakan Platform Layanan Situs Web untuk dapat diakses ke semua layanan Inzaghi's Group. Inzaghi's Sites juga menyimpan beberapa Layanan di Inzaghi's Group seperti Inzaghi's Blog dan Inzaghi's Media (Juga Inzaghi's Dev).",
      'image': 'assets/images/inzaghis-sites-by-inzaghis-group-corp.png',
    },
    {
      'title': "Inzaghi's Media",
      'description':
          "Inzaghi's Media merupakan Platform Layanan untuk Sharing Ilmu, terutama seputar IT.",
      'image': 'assets/images/inzaghis-media-by-inzaghis-group-corp.png',
    },
    {
      'title': "Inzaghi's Dev",
      'description':
          "Inzaghi's Dev merupakan kumpulan Proyek TI untuk menyimpan Kode Program seperti Website, Aplikasi Sederhana, Program-program Dasar, hingga API.",
      'image': 'assets/images/inzaghis-dev-by-inzaghis-group-corp.png',
    },
    {
      'title': "Inzaghi's Archives",
      'description':
          "Inzaghi's Archives merupakan Pengarsipan File-file dalam bentuk Dokumen seperti Dokumen/Word (.doc), Excel (.xls), PowerPoint/Slide/Presentasi/PPT (.ppt), PDF (.pdf), dan File berbentuk Zip (.zip dan .rar).",
      'image': 'assets/images/inzaghis-archives-by-inzaghis-group-corp.png',
    },
    {
      'title': "Inzaghi's AI",
      'description':
          "Inzaghi's AI merupakan Platform berbasis Kecerdasan Buatan (AI) yang akan tersedia di Inzaghi's Sites (Web) dan Inzaghi's App (Mobile).",
      'image': 'assets/images/inzaghis-ai-by-inzaghis-group-corp.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Inzaghi\'s Group'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "OUR NETWORKS",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              "Inzaghi's Group merupakan Layanan Konten Multifungsi seperti Inzaghi's Blog, Inzaghi's Sites, Inzaghi's Media, Inzaghi's Dev, Inzaghi's App, Inzaghi's Archives, Inzaghi's AI, dan Inzaghi's Shop.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/inzaghis-group-partners.png',
              width: 350,
              errorBuilder: (context, error, stackTrace) => SizedBox(height: 0),
            ),
            SizedBox(height: 30),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: networks.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          networks[index]['image']!,
                          height: 120,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) => Icon(
                              Icons.image_not_supported,
                              size: 50,
                              color: Colors.grey),
                        ),
                        SizedBox(height: 15),
                        Text(
                          networks[index]['title']!,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          networks[index]['description']!,
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Click here"),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
