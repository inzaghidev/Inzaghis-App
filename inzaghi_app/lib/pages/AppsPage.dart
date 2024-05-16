// apps_page.dart
import 'package:flutter/material.dart';

class AppsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Apps'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 2,
                ),
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10), // Add padding to each child
                    child: Container(height: 10, width: 10, color: Colors.cyan),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10), // Add padding to each child
                    child: Container(height: 10, width: 10, color: Colors.cyan),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10), // Add padding to each child
                    child: Container(height: 10, width: 10, color: Colors.cyan),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10), // Add padding to each child
                    child: Container(height: 10, width: 10, color: Colors.cyan),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10), // Add padding to each child
                    child: Container(height: 10, width: 10, color: Colors.cyan),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10), // Add padding to each child
                    child: Container(height: 10, width: 10, color: Colors.blue),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10), // Add padding to each child
                    child: Container(height: 10, width: 10, color: Colors.red),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10), // Add padding to each child
                    child: Container(height: 10, width: 10, color: Colors.blue),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10), // Add padding to each child
                    child: Container(height: 10, width: 10, color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
