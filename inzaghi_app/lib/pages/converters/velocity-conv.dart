import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

class VelocityConv extends StatefulWidget {
  const VelocityConv({super.key});

  @override
  State<VelocityConv> createState() => _VelocityConvState();
}

class _VelocityConvState extends State<VelocityConv> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView();
  }
}
