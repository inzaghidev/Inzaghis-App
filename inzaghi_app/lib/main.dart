import 'package:flutter/material.dart';
import 'package:inzaghi_app/pages/about_page.dart';
import 'package:inzaghi_app/pages/apps_page.dart';
import 'package:inzaghi_app/pages/settings_page.dart';
import 'package:inzaghi_app/screens/home_page.dart';
import 'package:inzaghi_app/widgets/navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(), // Use Home widget as the main route
        '/about': (context) => AboutPage(),
        '/apps': (context) => AppsPage(),
        '/settings': (context) => SettingsPage(),
        // Add other routes here
      },
    );
  }
}
