import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

class CurrentConv extends StatefulWidget {
  const CurrentConv({super.key});

  @override
  State<CurrentConv> createState() => _CurrentConvState();
}

class _CurrentConvState extends State<CurrentConv> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView();
  }
}
