import 'package:flutter/material.dart';

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
            leading: Icon(Icons.hexagon_outlined),
            title: Text("Inzaghi's Group"),
            onTap: () {
              Navigator.pushNamed(context, '/inzaghis-group');
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text("Inzaghi's Blog"),
            onTap: () {
              Navigator.pushNamed(context, '/inzaghis-blog');
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.mobile_friendly),
            title: Text("Inzaghi's Media"),
            onTap: () {
              Navigator.pushNamed(context, '/inzaghis-media');
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
    );
  }
}
