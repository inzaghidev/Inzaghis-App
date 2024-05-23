import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

class AccelerationConv extends StatefulWidget {
  const AccelerationConv({super.key});

  @override
  State<AccelerationConv> createState() => _AccelerationConvState();
}

class _AccelerationConvState extends State<AccelerationConv> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView();
  }
}
