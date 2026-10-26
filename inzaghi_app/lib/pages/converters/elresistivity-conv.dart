import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

class ElectricResistivityConv extends StatefulWidget {
  const ElectricResistivityConv({super.key});

  @override
  State<ElectricResistivityConv> createState() =>
      _ElectricResistivityConvState();
}

class _ElectricResistivityConvState extends State<ElectricResistivityConv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Electric Resistivity Converter'),
      ),
      body: SingleChildScrollView(),
    );
  }
}
