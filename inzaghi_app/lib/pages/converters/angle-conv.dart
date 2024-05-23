import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

const List<String> angle = [];
const List<String> angleAbr = [];

class AngleConv extends StatefulWidget {
  const AngleConv({super.key});

  @override
  State<AngleConv> createState() => _AngleConvState();
}

class _AngleConvState extends State<AngleConv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Angle Converter'),
      ),
      body: SingleChildScrollView(),
    );
  }
}
