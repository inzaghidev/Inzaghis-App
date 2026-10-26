import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

class ElectricConductanceConv extends StatefulWidget {
  const ElectricConductanceConv({super.key});

  @override
  State<ElectricConductanceConv> createState() =>
      _ElectricConductanceConvState();
}

class _ElectricConductanceConvState extends State<ElectricConductanceConv> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView();
  }
}
