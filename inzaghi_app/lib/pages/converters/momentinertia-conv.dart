import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

const List<String> momentInrtia = [];
const List<String> momentInrtiaAbr = [];

class MomentInertiaConv extends StatefulWidget {
  const MomentInertiaConv({super.key});

  @override
  State<MomentInertiaConv> createState() => _MomentInertiaConvState();
}

class _MomentInertiaConvState extends State<MomentInertiaConv> {
  String? selmomentInrtiaFrom = ' ()';
  String? selmomentInrtiaTo = ' ()';

  final TextEditingController inputValueController = TextEditingController();
  final TextEditingController outputValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Moment Inertia Converter'),
      ),
      body: SingleChildScrollView(),
    );
  }
}
