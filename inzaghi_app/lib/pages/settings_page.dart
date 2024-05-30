<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:inzaghi_app/widgets/navbar.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.question_mark),
            title: Text('About'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('Appearance'),
            onTap: () {
              // Navigate to Appearance settings
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            onTap: () {
              // Navigate to Language settings
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help Center'),
            onTap: () {
              // Navigate to Help Center
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.contact_emergency),
            title: Text('Contact'),
            onTap: () {
              // Navigate to Help Center
            },
          ),
        ],
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
=======
import 'package:flutter/material.dart';
import 'package:inzaghi_app/widgets/navbar.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.question_mark),
            title: Text('About'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('Appearance'),
            onTap: () {
              // Navigate to Appearance settings
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            onTap: () {
              // Navigate to Language settings
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help Center'),
            onTap: () {
              // Navigate to Help Center
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.contact_emergency),
            title: Text('Contact'),
            onTap: () {
              // Navigate to Help Center
            },
          ),
        ],
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
>>>>>>> d45315d (Addedsome Files)
