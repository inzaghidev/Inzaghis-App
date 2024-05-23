import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

const List<String> weights = [
  'Microngram (µ)',
  'Milligram (mg)',
  'Gram (g)',
  'Kilogram (kg)',
  'Tons',
  'Kiloton',
  'Megaton',
  'Grain',
  'Quintal',
  'Ounce',
  'Pound',
  'Carat',
];

const List<String> weightsAbr = [
  'µ',
  'mg',
  'g',
  'kg',
  'ton',
  'kt',
  'mt',
  'gr',
  'cwt',
  'ons',
  'pon',
  'ct',
];

const Map<String, double> weightConversionFactors = {
  'Microngram (µ)': 1e-9,
  'Milligram (mg)': 1e-6,
  'Gram (g)': 1e-3,
  'Kilogram (kg)': 1.0,
  'Tons': 1000.0,
  'Kiloton': 1e6,
  'Megaton': 1e9,
  'Grain': 6.479891e-5,
  'Quintal': 100.0,
  'Ounce': 0.0283495,
  'Pound': 0.453592,
  'Carat': 0.0002,
};

class WeightConv extends StatefulWidget {
  const WeightConv({super.key});

  @override
  State<WeightConv> createState() => _WeightConvState();
}

class _WeightConvState extends State<WeightConv> {
  String? selweightFrom = 'Kilogram (kg)';
  String? selweightTo = 'Gram (g)';

  final TextEditingController inputValueController = TextEditingController();
  final TextEditingController outputValueController = TextEditingController();

  void convert() {
    double input = double.tryParse(inputValueController.text) ?? 0.0;
    double factorFrom = weightConversionFactors[selweightFrom!]!;
    double factorTo = weightConversionFactors[selweightTo!]!;
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
        title: const Text('Weight Converter'),
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
                  "Masukkan Massa",
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
                value: selweightFrom,
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
                    selweightFrom = newValue;
                  });
                },
                items: weights.map<DropdownMenuItem<String>>((String value) {
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
                value: selweightTo,
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
                    selweightTo = newValue;
                  });
                },
                items: weights.map<DropdownMenuItem<String>>((String value) {
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
                        weightsAbr[weights.indexOf(selweightFrom!)],
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
                        weightsAbr[weights.indexOf(selweightTo!)],
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
