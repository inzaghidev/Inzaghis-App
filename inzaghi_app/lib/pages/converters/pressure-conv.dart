import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

const List<String> pressures = [];
const List<String> pressuresAbr = [];

class PressureConv extends StatefulWidget {
  const PressureConv({super.key});

  @override
  State<PressureConv> createState() => _PressureConvState();
}

class _PressureConvState extends State<PressureConv> {
  String? selpressureFrom = ' ()';
  String? selpressureTo = ' ()';

  final TextEditingController inputValueController = TextEditingController();
  final TextEditingController outputValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Pressure Converter'),
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
                  "Masukkan Tekanan",
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
                value: selpressureFrom,
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
                    selpressureFrom = newValue;
                  });
                },
                items: pressures.map<DropdownMenuItem<String>>((String value) {
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
                value: selpressureTo,
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
                    selpressureTo = newValue;
                  });
                },
                items: pressures.map<DropdownMenuItem<String>>((String value) {
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
