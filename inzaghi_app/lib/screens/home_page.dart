import 'package:flutter/material.dart';
import 'package:inzaghi_app/pages/about_page.dart';
import 'package:inzaghi_app/pages/apps_page.dart';
import 'package:inzaghi_app/widgets/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<String> _routes = ['/', '/apps', '/settings']; // Routes array

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigate to corresponding route based on index
    Navigator.pushNamed(context, _routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inzaghi's App"),
      ),
      body: SingleChildScrollView(
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
      bottomNavigationBar: NavBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onDestinationSelected,
      ),
    );
  }
}
