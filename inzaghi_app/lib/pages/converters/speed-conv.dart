<<<<<<< HEAD
import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

const List<String> speedUnits = [
  'Millimeter/Second (mm/s)',
  'Millimeter/Minute (mm/min)',
  'Millimeter/Hour (mm/h)',
  'Centimeter/Second (cm/s)',
  'Centimeter/Minute (cm/min)',
  'Centimeter/Hour (cm/h)',
  'Meter/Second (m/s)',
  'Meter/Minute (m/min)',
  'Meter/Hour (m/h)',
  'Kilometer/Second (km/s)',
  'Kilometer/Minute (km/min)',
  'Kilometer/Hour (km/h)',
  'Foot/Second (ft/s)',
  'Foot/Minute (ft/min)',
  'Foot/Hour (ft/h)',
  'Yard/Second (yd/s)',
  'Yard/Minute (yd/min)',
  'Yard/Hour (yd/h)',
  'Mile/Second (mi/s)',
  'Mile/Minute (mi/min)',
  'Mile/Hour (mi/h)',
];

const List<String> speedUnitsAbr = [
  'mm/s',
  'mm/min',
  'mm/h',
  'cm/s',
  'cm/min',
  'cm/h',
  'm/s',
  'm/min',
  'm/h',
  'km/s',
  'km/min',
  'km/h',
  'ft/s',
  'ft/min',
  'ft/h',
  'yd/s',
  'yd/min',
  'yd/h',
  'mi/s',
  'mi/min',
  'mi/h',
];

const Map<String, double> speedConversionFactors = {
  'Millimeter/Second (mm/s)': 0.001,
  'Millimeter/Minute (mm/min)': 0.001 / 60,
  'Millimeter/Hour (mm/h)': 0.001 / 3600,
  'Centimeter/Second (cm/s)': 0.01,
  'Centimeter/Minute (cm/min)': 0.01 / 60,
  'Centimeter/Hour (cm/h)': 0.01 / 3600,
  'Meter/Second (m/s)': 1,
  'Meter/Minute (m/min)': 1 / 60,
  'Meter/Hour (m/h)': 1 / 3600,
  'Kilometer/Second (km/s)': 1000,
  'Kilometer/Minute (km/min)': 1000 / 60,
  'Kilometer/Hour (km/h)': 1000 / 3600,
  'Foot/Second (ft/s)': 0.3048,
  'Foot/Minute (ft/min)': 0.3048 / 60,
  'Foot/Hour (ft/h)': 0.3048 / 3600,
  'Yard/Second (yd/s)': 0.9144,
  'Yard/Minute (yd/min)': 0.9144 / 60,
  'Yard/Hour (yd/h)': 0.9144 / 3600,
  'Mile/Second (mi/s)': 1609.34,
  'Mile/Minute (mi/min)': 1609.34 / 60,
  'Mile/Hour (mi/h)': 1609.34 / 3600,
};

class SpeedConv extends StatefulWidget {
  const SpeedConv({super.key});

  @override
  State<SpeedConv> createState() => _SpeedConvState();
}

class _SpeedConvState extends State<SpeedConv> {
  String? selspeedFrom = 'Meter/Second (m/s)';
  String? selspeedTo = 'Kilometer/Hour (km/h)';

  final TextEditingController inputValueController = TextEditingController();
  final TextEditingController outputValueController = TextEditingController();

  void convert() {
    double input = double.tryParse(inputValueController.text) ?? 0.0;
    double factorFrom = speedConversionFactors[selspeedFrom!]!;
    double factorTo = speedConversionFactors[selspeedTo!]!;
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
        title: const Text('Speed Converter'),
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
                  "Masukkan Kecepatan",
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
                value: selspeedFrom,
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
                    selspeedFrom = newValue;
                  });
                },
                items: speedUnits.map<DropdownMenuItem<String>>((String value) {
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
                value: selspeedTo,
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
                    selspeedTo = newValue;
                  });
                },
                items: speedUnits.map<DropdownMenuItem<String>>((String value) {
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
                        speedUnitsAbr[speedUnits.indexOf(selspeedFrom!)],
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
                        speedUnitsAbr[speedUnits.indexOf(selspeedTo!)],
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

const List<String> speedUnits = [
  'Millimeter/Second (mm/s)',
  'Millimeter/Minute (mm/min)',
  'Millimeter/Hour (mm/h)',
  'Centimeter/Second (cm/s)',
  'Centimeter/Minute (cm/min)',
  'Centimeter/Hour (cm/h)',
  'Meter/Second (m/s)',
  'Meter/Minute (m/min)',
  'Meter/Hour (m/h)',
  'Kilometer/Second (km/s)',
  'Kilometer/Minute (km/min)',
  'Kilometer/Hour (km/h)',
  'Foot/Second (ft/s)',
  'Foot/Minute (ft/min)',
  'Foot/Hour (ft/h)',
  'Yard/Second (yd/s)',
  'Yard/Minute (yd/min)',
  'Yard/Hour (yd/h)',
  'Mile/Second (mi/s)',
  'Mile/Minute (mi/min)',
  'Mile/Hour (mi/h)',
];

const List<String> speedUnitsAbr = [
  'mm/s',
  'mm/min',
  'mm/h',
  'cm/s',
  'cm/min',
  'cm/h',
  'm/s',
  'm/min',
  'm/h',
  'km/s',
  'km/min',
  'km/h',
  'ft/s',
  'ft/min',
  'ft/h',
  'yd/s',
  'yd/min',
  'yd/h',
  'mi/s',
  'mi/min',
  'mi/h',
];

const Map<String, double> speedConversionFactors = {
  'Millimeter/Second (mm/s)': 0.001,
  'Millimeter/Minute (mm/min)': 0.001 / 60,
  'Millimeter/Hour (mm/h)': 0.001 / 3600,
  'Centimeter/Second (cm/s)': 0.01,
  'Centimeter/Minute (cm/min)': 0.01 / 60,
  'Centimeter/Hour (cm/h)': 0.01 / 3600,
  'Meter/Second (m/s)': 1,
  'Meter/Minute (m/min)': 1 / 60,
  'Meter/Hour (m/h)': 1 / 3600,
  'Kilometer/Second (km/s)': 1000,
  'Kilometer/Minute (km/min)': 1000 / 60,
  'Kilometer/Hour (km/h)': 1000 / 3600,
  'Foot/Second (ft/s)': 0.3048,
  'Foot/Minute (ft/min)': 0.3048 / 60,
  'Foot/Hour (ft/h)': 0.3048 / 3600,
  'Yard/Second (yd/s)': 0.9144,
  'Yard/Minute (yd/min)': 0.9144 / 60,
  'Yard/Hour (yd/h)': 0.9144 / 3600,
  'Mile/Second (mi/s)': 1609.34,
  'Mile/Minute (mi/min)': 1609.34 / 60,
  'Mile/Hour (mi/h)': 1609.34 / 3600,
};

class SpeedConv extends StatefulWidget {
  const SpeedConv({super.key});

  @override
  State<SpeedConv> createState() => _SpeedConvState();
}

class _SpeedConvState extends State<SpeedConv> {
  String? selspeedFrom = 'Meter/Second (m/s)';
  String? selspeedTo = 'Kilometer/Hour (km/h)';

  final TextEditingController inputValueController = TextEditingController();
  final TextEditingController outputValueController = TextEditingController();

  void convert() {
    double input = double.tryParse(inputValueController.text) ?? 0.0;
    double factorFrom = speedConversionFactors[selspeedFrom!]!;
    double factorTo = speedConversionFactors[selspeedTo!]!;
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
        title: const Text('Speed Converter'),
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
                  "Masukkan Kecepatan",
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
                value: selspeedFrom,
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
                    selspeedFrom = newValue;
                  });
                },
                items: speedUnits.map<DropdownMenuItem<String>>((String value) {
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
                value: selspeedTo,
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
                    selspeedTo = newValue;
                  });
                },
                items: speedUnits.map<DropdownMenuItem<String>>((String value) {
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
                        speedUnitsAbr[speedUnits.indexOf(selspeedFrom!)],
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
                        speedUnitsAbr[speedUnits.indexOf(selspeedTo!)],
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
