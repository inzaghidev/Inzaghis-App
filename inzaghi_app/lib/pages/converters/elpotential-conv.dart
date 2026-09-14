import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

class ElectricPotentialConv extends StatefulWidget {
  const ElectricPotentialConv({super.key});

  @override
  State<ElectricPotentialConv> createState() => _ElectricPotentialConvState();
}

class _ElectricPotentialConvState extends State<ElectricPotentialConv> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Electric Potential Converter'),
      ),
      body: SingleChildScrollView(),
    );
  }
}
