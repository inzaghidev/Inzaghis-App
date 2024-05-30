import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                          'assets/images\/inzaghi-posuma-alkahfi.jpg'), // Ganti dengan path gambar profil Anda
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Inzaghi Posuma Al Kahfi',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Accounts :',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Instagram: @inzaghiposuma'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('TikTok: @posuma17'),
              ),
              const ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('GitHub: inzaghipa1709'),
              ),
              SizedBox(height: 24),
              Text(
                'Website :',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              ListTile(
                leading: Icon(Icons.web),
                title: Text('Inzaghi\'s Sites: inzaghisites.000webhostapp.com'),
              ),
              SizedBox(height: 24),
              Text(
                'Blogs (Inzaghi\'s Blog) :',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              ListTile(
                leading: Icon(Icons.book),
                title: Text('Legacy : inzaghiposuma.blogspot.com'),
              ),
              ListTile(
                leading: Icon(Icons.book),
                title: Text('Teknoblog : enzatech.blogspot.com'),
              ),
              ListTile(
                leading: Icon(Icons.book),
                title: Text('Miniblog : enzashorts.blogspot.com'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
