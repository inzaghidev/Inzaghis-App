import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

const List<String> linearCurrentDensity = <String>[
  'ampere/meter (A/m)',
  'milliampere/meter (mA/m)',
  'microampere/meter (µA/m)',
  'nanoampere/meter (nA/m)',
];

final List<String> chargeAbr = const <String>[
  'A/m',
  'mA/m',
  'µA/m',
  'nA/m',
];

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
