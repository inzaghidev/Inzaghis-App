import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

class DataStorageConv extends StatefulWidget {
  const DataStorageConv({super.key});

  @override
  State<DataStorageConv> createState() => _DataStorageConvState();
}

class _DataStorageConvState extends State<DataStorageConv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Elecricity Converter'),
      ),
      body: SingleChildScrollView(),
    );
  }
}
