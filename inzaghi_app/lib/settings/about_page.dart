// about_page.dart
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Inzaghi's App",
              textScaleFactor: 2.0,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/inzaghis-app-logo-vertical-transparent.png',
              width: 200,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              "Inzaghi's App merupakan Aplikasi Konten-konten yang menyajikan apapun dengan Tampilan Versi Mobile dari Inzaghi's Sites, seperti Inzaghi's Blog, Inzaghi's Media, dan Inzaghi's Group. Nantinya, Inzaghi's App akan tersedia dalam Versi Android dan iOS.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),
            Image.asset(
              'assets/images/inzaghis-app-by-inzaghis-group-corp.png',
              width: 350,
              height: 224,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
