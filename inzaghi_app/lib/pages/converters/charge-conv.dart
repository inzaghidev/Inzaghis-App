import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

class ChargeConv extends StatefulWidget {
  const ChargeConv({super.key});

  @override
  State<ChargeConv> createState() => _ChargeConvState();
}

class _ChargeConvState extends State<ChargeConv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Charge Converter'),
      ),
      body: SingleChildScrollView(),
    );
  }
}
