import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

const List<String> lengths = [
  'Nanometer (nm)',
  'Micron/Micrometer (µ)',
  'Millimeter (mm)',
  'Centimeter (cm)',
  'Decimeter (dm)',
  'Meter (m)',
  'Dekameter (dam)',
  'Hectometer (hm)',
  'Kilometer (km)',
  'Megameter (Mm)',
  'Inches (in)',
  'Feet (ft)',
  'Yard (yd)',
  'Mile (mi)',
];

const List<String> lengthsAbr = [
  'nm',
  'µ',
  'mm',
  'cm',
  'dm',
  'm',
  'dam',
  'hm',
  'km',
  'Mm',
  'in',
  'ft',
  'yd',
  'mi',
];

const Map<String, double> lengthConversionFactors = {
  'Nanometer (nm)': 1e-9,
  'Micron/Micrometer (µ)': 1e-6,
  'Millimeter (mm)': 1e-3,
  'Centimeter (cm)': 1e-2,
  'Decimeter (dm)': 0.1,
  'Meter (m)': 1.0,
  'Dekameter (dam)': 10.0,
  'Hectometer (hm)': 100.0,
  'Kilometer (km)': 1000.0,
  'Megameter (Mm)': 1e6,
  'Inches (inch)': 0.0254,
  'Feet (ft)': 0.3048,
  'Yard (yd)': 0.9144,
  'Mile (mi)': 1609.34,
};

class LengthConv extends StatefulWidget {
  const LengthConv({Key? key}) : super(key: key);

  @override
  _LengthConvState createState() => _LengthConvState();
}

class _LengthConvState extends State<LengthConv> {
  String? sellengthFrom = 'Centimeter (cm)';
  String? sellengthTo = 'Meter (m)';

  final TextEditingController inputValueController = TextEditingController();
  final TextEditingController outputValueController = TextEditingController();

  void convert() {
    double input = double.tryParse(inputValueController.text) ?? 0.0;
    double factorFrom = lengthConversionFactors[sellengthFrom!]!;
    double factorTo = lengthConversionFactors[sellengthTo!]!;
    double result = input * (factorFrom / factorTo);

    setState(() {
      outputValueController.text = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Length Converter'),
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
                  "Masukkan Panjang",
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
                value: sellengthFrom,
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
                    sellengthFrom = newValue;
                  });
                },
                items: lengths.map<DropdownMenuItem<String>>((String value) {
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
                value: sellengthTo,
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
                    sellengthTo = newValue;
                  });
                },
                items: lengths.map<DropdownMenuItem<String>>((String value) {
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
                        lengthsAbr[lengths.indexOf(sellengthFrom!)],
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
                        lengthsAbr[lengths.indexOf(sellengthTo!)],
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
