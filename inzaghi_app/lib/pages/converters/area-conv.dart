import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

const List<String> areas = [
  'Square Millimeter (mm^2)',
  'Square Centimeter (cm^2)',
  'Square Decimeter (dm^2)',
  'Square Meter (m^2)',
  'Square Dekameter (dam^2) / Are (a)',
  'Hectare (ha)',
  'Square Kilometer (km^2)',
  'Square Inches (in^2)',
  'Square Feet (ft^2)',
  'Square Yard (yd^2)',
  'Square Mile (mi^2)',
];

const List<String> areasAbr = [
  'mm^2',
  'cm^2',
  'dm^2',
  'm^2',
  'a / dam^2',
  'ha',
  'km^2',
  'in^2',
  'ft^2',
  'yd^2',
  'mi^2',
];

const Map<String, double> areaConversionFactors = {
  'Square Millimeter (mm^2)': 1e-6,
  'Square Centimeter (cm^2)': 1e-4,
  'Square Decimeter (dm^2)': 1e-2,
  'Square Meter (m^2)': 1.0,
  'Square Dekameter (dam^2) / Are (a)': 100.0,
  'Hectare (ha)': 10000.0,
  'Square Kilometer (km^2)': 1e6,
  'Square Inches (in^2)': 0.00064516,
  'Square Feet (ft^2)': 0.092903,
  'Square Yard (yd^2)': 0.836127,
  'Square Mile (mi^2)': 2.59e6,
};

class AreaConv extends StatefulWidget {
  const AreaConv({super.key});

  @override
  State<AreaConv> createState() => _AreaConvState();
}

class _AreaConvState extends State<AreaConv> {
  String? selareaFrom = 'Square Meter (m^2)';
  String? selareaTo = 'Square Kilometer (km^2)';

  final TextEditingController inputValueController = TextEditingController();
  final TextEditingController outputValueController = TextEditingController();

  void convert() {
    double input = double.tryParse(inputValueController.text) ?? 0.0;
    double factorFrom = areaConversionFactors[selareaFrom!]!;
    double factorTo = areaConversionFactors[selareaTo!]!;
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
        title: const Text('Area Converter'),
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
                  "Masukkan Luas",
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
                value: selareaFrom,
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
                    selareaFrom = newValue;
                  });
                },
                items: areas.map<DropdownMenuItem<String>>((String value) {
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
                value: selareaTo,
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
                    selareaTo = newValue;
                  });
                },
                items: areas.map<DropdownMenuItem<String>>((String value) {
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
                        areasAbr[areas.indexOf(selareaFrom!)],
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
                        areasAbr[areas.indexOf(selareaTo!)],
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
