import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

class DensityConv extends StatefulWidget {
  const DensityConv({super.key});

  @override
  State<DensityConv> createState() => _DensityConvState();
}

class _DensityConvState extends State<DensityConv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Density Converter'),
      ),
      body: SingleChildScrollView(),
    );
  }
}
