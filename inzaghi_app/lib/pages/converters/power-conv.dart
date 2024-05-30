<<<<<<< HEAD
import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

const List<String> power = [
  'Nanowatt (nW)',
  'Microwatt (µW)',
  'Miliwatt (mW)',
  'Centiwatt (cW)',
  'Deciwatt (dW)',
  'Watt (W)',
  'Dekawatt (daW)',
  'Hectowatt (hW)',
  'Kilowatt (kW)',
  'Megawatt (MW)',
  'Gigawatt (GW)',
  'Terawatt (TW)',
  'Exawatt (EW)',
];

const List<String> powerAbr = [
  'nW',
  'µW',
  'mW',
  'cW',
  'dW',
  'W',
  'daW',
  'hW',
  'kW',
  'MW',
  'GW',
  'TW',
  'EW',
];

class PowerConv extends StatefulWidget {
  const PowerConv({super.key});

  @override
  State<PowerConv> createState() => _PowerConvState();
}

class _PowerConvState extends State<PowerConv> {
  String? selpowerFrom = 'Watt (W)';
  String? selpowerTo = 'Kilowatt (kW)';

  final TextEditingController inputValueController = TextEditingController();
  final TextEditingController outputValueController = TextEditingController();

  void convert() {
    double inputPower = double.tryParse(inputValueController.text) ?? 0.0;
    double outputPower = _convertPower(inputPower, selpowerFrom!, selpowerTo!);
    setState(() {
      outputValueController.text = outputPower.toString();
    });
  }

  double _convertPower(double value, String from, String to) {
    // Define conversion factors
    const Map<String, double> conversionFactors = {
      'nW': 1e-9,
      'µW': 1e-6,
      'mW': 1e-3,
      'cW': 1e-2,
      'dW': 0.1,
      'W': 1.0,
      'daW': 10.0,
      'hW': 100.0,
      'kW': 1e3,
      'MW': 1e6,
      'GW': 1e9,
      'TW': 1e12,
      'EW': 1e15,
    };

    // Extract the abbreviations from the full unit name
    String fromAbr = powerAbr[power.indexOf(from)];
    String toAbr = powerAbr[power.indexOf(to)];

    // Convert input power to Watt
    double wattValue = value / conversionFactors[fromAbr]!;

    // Convert Watt to target unit
    double result = wattValue * conversionFactors[toAbr]!;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Power Converter'),
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
                  "Masukkan Daya",
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
                value: selpowerFrom,
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
                    selpowerFrom = newValue;
                  });
                },
                items: power.map<DropdownMenuItem<String>>((String value) {
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
                value: selpowerTo,
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
                    selpowerTo = newValue;
                  });
                },
                items: power.map<DropdownMenuItem<String>>((String value) {
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
                        powerAbr[power.indexOf(selpowerFrom!)],
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
                        powerAbr[power.indexOf(selpowerTo!)],
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
=======
import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

const List<String> power = [
  'Nanowatt (nW)',
  'Microwatt (µW)',
  'Miliwatt (mW)',
  'Centiwatt (cW)',
  'Deciwatt (dW)',
  'Watt (W)',
  'Dekawatt (daW)',
  'Hectowatt (hW)',
  'Kilowatt (kW)',
  'Megawatt (MW)',
  'Gigawatt (GW)',
  'Terawatt (TW)',
  'Exawatt (EW)',
];

const List<String> powerAbr = [
  'nW',
  'µW',
  'mW',
  'cW',
  'dW',
  'W',
  'daW',
  'hW',
  'kW',
  'MW',
  'GW',
  'TW',
  'EW',
];

class PowerConv extends StatefulWidget {
  const PowerConv({super.key});

  @override
  State<PowerConv> createState() => _PowerConvState();
}

class _PowerConvState extends State<PowerConv> {
  String? selpowerFrom = 'Watt (W)';
  String? selpowerTo = 'Kilowatt (kW)';

  final TextEditingController inputValueController = TextEditingController();
  final TextEditingController outputValueController = TextEditingController();

  void convert() {
    double inputPower = double.tryParse(inputValueController.text) ?? 0.0;
    double outputPower = _convertPower(inputPower, selpowerFrom!, selpowerTo!);
    setState(() {
      outputValueController.text = outputPower.toString();
    });
  }

  double _convertPower(double value, String from, String to) {
    // Define conversion factors
    const Map<String, double> conversionFactors = {
      'nW': 1e-9,
      'µW': 1e-6,
      'mW': 1e-3,
      'cW': 1e-2,
      'dW': 0.1,
      'W': 1.0,
      'daW': 10.0,
      'hW': 100.0,
      'kW': 1e3,
      'MW': 1e6,
      'GW': 1e9,
      'TW': 1e12,
      'EW': 1e15,
    };

    // Extract the abbreviations from the full unit name
    String fromAbr = powerAbr[power.indexOf(from)];
    String toAbr = powerAbr[power.indexOf(to)];

    // Convert input power to Watt
    double wattValue = value / conversionFactors[fromAbr]!;

    // Convert Watt to target unit
    double result = wattValue * conversionFactors[toAbr]!;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Power Converter'),
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
                  "Masukkan Daya",
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
                value: selpowerFrom,
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
                    selpowerFrom = newValue;
                  });
                },
                items: power.map<DropdownMenuItem<String>>((String value) {
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
                value: selpowerTo,
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
                    selpowerTo = newValue;
                  });
                },
                items: power.map<DropdownMenuItem<String>>((String value) {
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
                        powerAbr[power.indexOf(selpowerFrom!)],
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
                        powerAbr[power.indexOf(selpowerTo!)],
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
>>>>>>> d45315d (Addedsome Files)
