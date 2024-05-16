import 'package:flutter/material.dart';
import 'package:inzaghi_app/widgets/navbar.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text('Settings Page'),
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: 2,
        onDestinationSelected: (int value) {
          // Array of routes to navigate
          final List<String> routes = ['/', '/apps', '/settings'];
          // Navigate to the route based on the selected index
          Navigator.pushReplacementNamed(context, routes[value]);
        },
      ),
    );
  }
}
