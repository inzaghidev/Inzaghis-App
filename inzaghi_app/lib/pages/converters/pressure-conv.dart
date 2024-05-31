import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

const List<String> pressures = [
  'Micropascal (µPa)',
  'Milipascal (mPa)',
  'Pascal (Pa)',
  'Kilopascal (kPa)',
  'Megapascal (MPa)',
  'Gigapascal (GPa)',
  'Terapascal (TPa)',
  'Atmosphere (atm)',
  'Bar',
  'Psi',
  'Ksi',
];
const List<String> pressuresAbr = [
  'µPa',
  'mPa',
  'Pa',
  'kPa',
  'MPa',
  'GPa',
  'TPa',
  'atm',
  'bar',
  'psi',
  'ksi',
];

// Conversion factors relative to Pascal (Pa)
const Map<String, double> conversionFactors = {
  'µPa': 1e-6,
  'mPa': 1e-3,
  'Pa': 1.0,
  'kPa': 1e3,
  'MPa': 1e6,
  'GPa': 1e9,
  'TPa': 1e12,
  'atm': 101325.0,
  'bar': 1e5,
  'psi': 6894.76,
  'ksi': 6894760.0,
};

class PressureConv extends StatefulWidget {
  const PressureConv({super.key});

  @override
  State<PressureConv> createState() => _PressureConvState();
}

class _PressureConvState extends State<PressureConv> {
  String? selpressureFrom = 'Pascal (Pa)';
  String? selpressureTo = 'Kilopascal (kPa)';

  final TextEditingController inputValueController = TextEditingController();
  final TextEditingController outputValueController = TextEditingController();

  void convert() {
    double? inputValue = double.tryParse(inputValueController.text);
    if (inputValue != null) {
      String fromAbr = pressuresAbr[pressures.indexOf(selpressureFrom!)];
      String toAbr = pressuresAbr[pressures.indexOf(selpressureTo!)];

      double fromFactor = conversionFactors[fromAbr]!;
      double toFactor = conversionFactors[toAbr]!;

      double valueInPa = inputValue * fromFactor;
      double convertedValue = valueInPa / toFactor;

      setState(() {
        outputValueController.text = convertedValue.toStringAsFixed(2);
      });
    }
  }

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
              Row(
                children: [
                  Expanded(
                    flex: 17, // 85% width
                    child: TextField(
                      controller: inputValueController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Input Nilai',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3, // 15% width
                    child: Container(
                      alignment: Alignment.center,
                      height: 60, // Match height of the TextField
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        pressuresAbr[pressures.indexOf(selpressureFrom!)],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: convert,
                child: const Text('Convert'),
              ),
              const SizedBox(height: 40.0),
              Row(
                children: [
                  Expanded(
                    flex: 17, // 85% width
                    child: TextField(
                      controller: outputValueController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Hasil Output',
                      ),
                      keyboardType: TextInputType.number,
                      enabled: false, // Disable the text field
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3, // 15% width
                    child: Container(
                      alignment: Alignment.center,
                      height: 60, // Match height of the TextField
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        pressuresAbr[pressures.indexOf(selpressureTo!)],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
