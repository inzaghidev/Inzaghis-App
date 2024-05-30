<<<<<<< HEAD
import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

class MomentInertiaConv extends StatefulWidget {
  const MomentInertiaConv({super.key});

  @override
  State<MomentInertiaConv> createState() => _MomentInertiaConvState();
}

class _MomentInertiaConvState extends State<MomentInertiaConv> {
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
=======
import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

class MomentInertiaConv extends StatefulWidget {
  const MomentInertiaConv({super.key});

  @override
  State<MomentInertiaConv> createState() => _MomentInertiaConvState();
}

class _MomentInertiaConvState extends State<MomentInertiaConv> {
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
>>>>>>> d45315d (Addedsome Files)
