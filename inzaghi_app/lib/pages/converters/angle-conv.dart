import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

const List<String> angle = [
  'Degree (°)',
  'Radian (rad)',
  'Grad (^g)',
  "Minute (')",
  'Second (")',
];
const List<String> angleAbr = ['°', 'rad', '^g', "'", '"'];

class AngleConv extends StatefulWidget {
  const AngleConv({super.key});

  @override
  State<AngleConv> createState() => _AngleConvState();
}

class _AngleConvState extends State<AngleConv> {
  String? selangleFrom = 'Degree (°)';
  String? selangleTo = 'Radian (rad)';

  final TextEditingController inputValueController = TextEditingController();
  final TextEditingController outputValueController = TextEditingController();

  void convert() {
    // Implement conversion logic here
    // For demonstration, we just set the output to the same as input
    setState(() {
      outputValueController.text = inputValueController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Angle Converter'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              const Center(
                child: Text(
                  "Masukkan Sudut",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Dari (From) :",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              DropdownButton<String>(
                value: selangleFrom,
                hint: const Text('Select Unit'),
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                isExpanded: true,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    selangleFrom = newValue;
                  });
                },
                items: angle.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Ke (To) :",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              DropdownButton<String>(
                value: selangleTo,
                hint: const Text('Select Unit'),
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                isExpanded: true,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    selangleTo = newValue;
                  });
                },
                items: angle.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: inputValueController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Input Nilai',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Implement conversion logic here
                },
                child: const Text('Convert'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
