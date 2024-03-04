// main.dart
import 'package:flutter/material.dart';
import 'pages/AboutPage.dart';
import 'pages/AppsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/about': (context) => AboutPage(),
        '/apps': (context) => AppsPage(),
        //'/inzaghis-group': (context) => InzaghisGroup(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inzaghi's App"),
      ),
      body: SingleChildScrollView(
        // Wrap the Column with SingleChildScrollView
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30),
              Text(
                "Welcome to Inzaghi's App!",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                "This App Platform is still Under Construction!",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 40),
              Image.asset(
                'assets/images/inzaghis-app-by-inzaghis-group-corp.png',
                width: 350,
                height: 224,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
                child: Text('About'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/apps');
                },
                child: Text('Apps'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
