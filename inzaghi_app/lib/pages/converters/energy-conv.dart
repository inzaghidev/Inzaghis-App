import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

const List<String> energy = [
  'Joule (J)',
  'Kilojoule (kJ)',
  'Watt-Hour (W*h)',
  'Calorie (cal)',
];
const List<String> energyAbr = [
  'J',
  'kJ',
  'W*h',
  'cal',
];

class EnergyConv extends StatefulWidget {
  const EnergyConv({super.key});

  @override
  State<EnergyConv> createState() => _EnergyConvState();
}

class _EnergyConvState extends State<EnergyConv> {
  String? selenergyFrom = 'Joule (J)';
  String? selenergyTo = 'Kilojoule (kJ)';

  final TextEditingController inputValueController = TextEditingController();
  final TextEditingController outputValueController = TextEditingController();

  void convert() {
    // Implement conversion logic here
    double? inputValue = double.tryParse(inputValueController.text);
    if (inputValue == null) {
      outputValueController.text = 'Invalid input';
      return;
    }

    double outputValue;
    if (selenergyFrom == selenergyTo) {
      outputValue = inputValue;
    } else {
      // For simplicity, we assume 1 unit conversion (you need to implement actual conversion logic)
      outputValue = inputValue; // Placeholder for actual conversion logic
    }

    setState(() {
      outputValueController.text = outputValue.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Energy Converter'),
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
                  "Masukkan Energi",
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
                value: selenergyFrom,
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
                    selenergyFrom = newValue;
                  });
                },
                items: energy.map<DropdownMenuItem<String>>((String value) {
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
                value: selenergyTo,
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
                    selenergyTo = newValue;
                  });
                },
                items: energy.map<DropdownMenuItem<String>>((String value) {
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
                onPressed: convert,
                child: const Text('Convert'),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: outputValueController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Output Nilai',
                ),
                readOnly: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
