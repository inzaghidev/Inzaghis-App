import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

class LinearCurrentDensityConv extends StatefulWidget {
  const LinearCurrentDensityConv({super.key});

  @override
  State<LinearCurrentDensityConv> createState() =>
      _LinearCurrentDensityConvState();
}

class _LinearCurrentDensityConvState extends State<LinearCurrentDensityConv> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Linear Current Density Converter'),
      ),
      body: SingleChildScrollView(),
    );
  }
}
