import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

const List<String> surfaceCurrentDensity = <String>[
  'ampere/square meter (A/m²)',
  'milliampere/square meter (mA/m²)',
  'microampere/square meter (µA/m²)',
  'nanoampere/square meter (nA/m²)',
];

final List<String> chargeAbr = const <String>[
  'A/m²',
  'mA/m²',
  'µA/m²',
  'nA/m²',
];

class SurfaceCurrentDensityConv extends StatefulWidget {
  const SurfaceCurrentDensityConv({super.key});

  @override
  State<SurfaceCurrentDensityConv> createState() =>
      _SurfaceCurrentDensityConvState();
}

class _SurfaceCurrentDensityConvState extends State<SurfaceCurrentDensityConv> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Surface Current Density Converter'),
      ),
      body: SingleChildScrollView(),
    );
  }
}
