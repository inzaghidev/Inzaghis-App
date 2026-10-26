import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

class InductanceConv extends StatefulWidget {
  const InductanceConv({super.key});

  @override
  State<InductanceConv> createState() => _InductanceConvState();
}

class _InductanceConvState extends State<InductanceConv> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView();
  }
}
