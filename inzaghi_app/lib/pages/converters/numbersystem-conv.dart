import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

class NumberSystemsConv extends StatefulWidget {
  const NumberSystemsConv({super.key});

  @override
  State<NumberSystemsConv> createState() => _NumberSystemsConvState();
}

class _NumberSystemsConvState extends State<NumberSystemsConv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Number System Converter'),
      ),
      body: SingleChildScrollView(),
    );
  }
}
