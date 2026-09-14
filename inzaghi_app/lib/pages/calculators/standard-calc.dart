import 'package:flutter/material.dart';

class StandardCalc extends StatelessWidget {
  const StandardCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Standard Calculator'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Result',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.grey,
              child: const Center(
                child: Text(
                  'Input',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
