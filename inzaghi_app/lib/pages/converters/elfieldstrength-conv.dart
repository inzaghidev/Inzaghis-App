import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

class ElectricFieldStrengthConv extends StatefulWidget {
  const ElectricFieldStrengthConv({super.key});

  @override
  State<ElectricFieldStrengthConv> createState() =>
      _ElectricFieldStrengthConvState();
}

class _ElectricFieldStrengthConvState extends State<ElectricFieldStrengthConv> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Electric Field Strength Converter'),
      ),
      body: SingleChildScrollView(),
    );
  }
}
