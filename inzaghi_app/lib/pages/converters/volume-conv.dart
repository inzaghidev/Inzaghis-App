import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

const List<String> volumes = [
  'Milliliter (ml)',
  'Liter (l)',
  'Cubic Millimeter (mm^3)',
  'Cubic Centimeter (cm^3)',
  'Cubic Decimeter (dm^3)',
  'Cubic Meter (m^3)',
  'Cubic Dekameter (dam^3)',
  'Cubic Kilometer (km^3)',
];

const List<String> volumesAbr = [
  'ml',
  'l',
  'mm^3',
  'cm^3',
  'dm^3',
  'm^3',
  'dam^3',
  'km^3',
];

const Map<String, double> volumeConversionFactors = {
  'Milliliter (ml)': 1e-6,
  'Liter (l)': 1e-3,
  'Cubic Millimeter (mm^3)': 1e-9,
  'Cubic Centimeter (cm^3)': 1e-6,
  'Cubic Decimeter (dm^3)': 1e-3,
  'Cubic Meter (m^3)': 1.0,
  'Cubic Dekameter (dam^3)': 1e3,
  'Cubic Kilometer (km^3)': 1e9,
};

class VolumeConv extends StatefulWidget {
  const VolumeConv({super.key});

  @override
  State<VolumeConv> createState() => _VolumeConvState();
}

class _VolumeConvState extends State<VolumeConv> {
  String? selvolumeFrom = 'Milliliter (ml)';
  String? selvolumeTo = 'Liter (l)';

  final TextEditingController inputValueController = TextEditingController();
  final TextEditingController outputValueController = TextEditingController();

  void convert() {
    double input = double.tryParse(inputValueController.text) ?? 0.0;
    double factorFrom = volumeConversionFactors[selvolumeFrom!]!;
    double factorTo = volumeConversionFactors[selvolumeTo!]!;
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
        title: const Text('Volume Converter'),
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
                  "Masukkan Volume",
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
                value: selvolumeFrom,
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
                    selvolumeFrom = newValue;
                  });
                },
                items: volumes.map<DropdownMenuItem<String>>((String value) {
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
                value: selvolumeTo,
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
                    selvolumeTo = newValue;
                  });
                },
                items: volumes.map<DropdownMenuItem<String>>((String value) {
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
                        volumesAbr[volumes.indexOf(selvolumeFrom!)],
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
                        volumesAbr[volumes.indexOf(selvolumeTo!)],
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
