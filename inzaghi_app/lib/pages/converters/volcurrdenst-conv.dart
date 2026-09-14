import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

class VolumeCurrentDensityConv extends StatefulWidget {
  const VolumeCurrentDensityConv({super.key});

  @override
  State<VolumeCurrentDensityConv> createState() =>
      _VolumeCurrentDensityConvState();
}

class _VolumeCurrentDensityConvState extends State<VolumeCurrentDensityConv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Volume Current Density Converter'),
      ),
      body: SingleChildScrollView(),
    );
  }
}
