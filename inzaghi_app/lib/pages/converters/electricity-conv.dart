import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

const List<String> electricity = [];
const List<String> electricityAbr = [];

class ElectricityConv extends StatefulWidget {
  const ElectricityConv({super.key});

  @override
  State<ElectricityConv> createState() => _ElectricityConvState();
}

class _ElectricityConvState extends State<ElectricityConv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Elecricity Converter'),
      ),
      body: SingleChildScrollView(),
    );
  }
}
