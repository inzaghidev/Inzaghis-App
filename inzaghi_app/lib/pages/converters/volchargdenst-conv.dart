import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

class VolumeChargeDensityConv extends StatefulWidget {
  const VolumeChargeDensityConv({super.key});

  @override
  State<VolumeChargeDensityConv> createState() =>
      _VolumeChargeDensityConvState();
}

class _VolumeChargeDensityConvState extends State<VolumeChargeDensityConv> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Volume Charge Density Converter'),
      ),
      body: SingleChildScrollView(),
    );
  }
}
