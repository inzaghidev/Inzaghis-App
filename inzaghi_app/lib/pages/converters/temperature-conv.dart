<<<<<<< HEAD
import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

const List<String> temperatures = [
  'Celsius (°C)',
  'Fahrenheit (°F)',
  'Reaumur (°r)',
  'Rankine (°R)',
  'Kelvin (K)'
];

const List<String> temperaturesAbr = ['°C', '°F', '°r', '°R', 'K'];

class TemperatureConv extends StatefulWidget {
  const TemperatureConv({super.key});

  @override
  State<TemperatureConv> createState() => _TemperatureConvState();
}

class _TemperatureConvState extends State<TemperatureConv> {
  String? seltemperaturesFrom = 'Celsius (°C)';
  String? seltemperaturesTo = 'Fahrenheit (°F)';

  final TextEditingController inputValueController = TextEditingController();
  final TextEditingController outputValueController = TextEditingController();

  double celsiusToFahrenheit(double c) => (c * 9 / 5) + 32;
  double celsiusToReaumur(double c) => c * 4 / 5;
  double celsiusToRankine(double c) => (c + 273.15) * 9 / 5;
  double celsiusToKelvin(double c) => c + 273.15;

  double fahrenheitToCelsius(double f) => (f - 32) * 5 / 9;
  double reaumurToCelsius(double r) => r * 5 / 4;
  double rankineToCelsius(double r) => (r - 491.67) * 5 / 9;
  double kelvinToCelsius(double k) => k - 273.15;

  double convertTemperature(double value, String from, String to) {
    double celsiusValue;

    // Convert from the original unit to Celsius
    switch (from) {
      case 'Celsius (°C)':
        celsiusValue = value;
        break;
      case 'Fahrenheit (°F)':
        celsiusValue = fahrenheitToCelsius(value);
        break;
      case 'Reaumur (°r)':
        celsiusValue = reaumurToCelsius(value);
        break;
      case 'Rankine (°R)':
        celsiusValue = rankineToCelsius(value);
        break;
      case 'Kelvin (K)':
        celsiusValue = kelvinToCelsius(value);
        break;
      default:
        throw Exception('Unknown temperature unit: $from');
    }

    // Convert from Celsius to the target unit
    switch (to) {
      case 'Celsius (°C)':
        return celsiusValue;
      case 'Fahrenheit (°F)':
        return celsiusToFahrenheit(celsiusValue);
      case 'Reaumur (°r)':
        return celsiusToReaumur(celsiusValue);
      case 'Rankine (°R)':
        return celsiusToRankine(celsiusValue);
      case 'Kelvin (K)':
        return celsiusToKelvin(celsiusValue);
      default:
        throw Exception('Unknown temperature unit: $to');
    }
  }

  void convert() {
    double input = double.tryParse(inputValueController.text) ?? 0.0;
    double result =
        convertTemperature(input, seltemperaturesFrom!, seltemperaturesTo!);

    setState(() {
      outputValueController.text = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Temperature Converter'),
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
                  "Masukkan Suhu",
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
                value: seltemperaturesFrom,
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
                    seltemperaturesFrom = newValue;
                  });
                },
                items:
                    temperatures.map<DropdownMenuItem<String>>((String value) {
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
                value: seltemperaturesTo,
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
                    seltemperaturesTo = newValue;
                  });
                },
                items:
                    temperatures.map<DropdownMenuItem<String>>((String value) {
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
                        temperaturesAbr[
                            temperatures.indexOf(seltemperaturesFrom!)],
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
                        temperaturesAbr[
                            temperatures.indexOf(seltemperaturesTo!)],
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

const List<String> temperatures = [
  'Celsius (°C)',
  'Fahrenheit (°F)',
  'Reaumur (°r)',
  'Rankine (°R)',
  'Kelvin (K)'
];

const List<String> temperaturesAbr = ['°C', '°F', '°r', '°R', 'K'];

class TemperatureConv extends StatefulWidget {
  const TemperatureConv({super.key});

  @override
  State<TemperatureConv> createState() => _TemperatureConvState();
}

class _TemperatureConvState extends State<TemperatureConv> {
  String? seltemperaturesFrom = 'Celsius (°C)';
  String? seltemperaturesTo = 'Fahrenheit (°F)';

  final TextEditingController inputValueController = TextEditingController();
  final TextEditingController outputValueController = TextEditingController();

  double celsiusToFahrenheit(double c) => (c * 9 / 5) + 32;
  double celsiusToReaumur(double c) => c * 4 / 5;
  double celsiusToRankine(double c) => (c + 273.15) * 9 / 5;
  double celsiusToKelvin(double c) => c + 273.15;

  double fahrenheitToCelsius(double f) => (f - 32) * 5 / 9;
  double reaumurToCelsius(double r) => r * 5 / 4;
  double rankineToCelsius(double r) => (r - 491.67) * 5 / 9;
  double kelvinToCelsius(double k) => k - 273.15;

  double convertTemperature(double value, String from, String to) {
    double celsiusValue;

    // Convert from the original unit to Celsius
    switch (from) {
      case 'Celsius (°C)':
        celsiusValue = value;
        break;
      case 'Fahrenheit (°F)':
        celsiusValue = fahrenheitToCelsius(value);
        break;
      case 'Reaumur (°r)':
        celsiusValue = reaumurToCelsius(value);
        break;
      case 'Rankine (°R)':
        celsiusValue = rankineToCelsius(value);
        break;
      case 'Kelvin (K)':
        celsiusValue = kelvinToCelsius(value);
        break;
      default:
        throw Exception('Unknown temperature unit: $from');
    }

    // Convert from Celsius to the target unit
    switch (to) {
      case 'Celsius (°C)':
        return celsiusValue;
      case 'Fahrenheit (°F)':
        return celsiusToFahrenheit(celsiusValue);
      case 'Reaumur (°r)':
        return celsiusToReaumur(celsiusValue);
      case 'Rankine (°R)':
        return celsiusToRankine(celsiusValue);
      case 'Kelvin (K)':
        return celsiusToKelvin(celsiusValue);
      default:
        throw Exception('Unknown temperature unit: $to');
    }
  }

  void convert() {
    double input = double.tryParse(inputValueController.text) ?? 0.0;
    double result =
        convertTemperature(input, seltemperaturesFrom!, seltemperaturesTo!);

    setState(() {
      outputValueController.text = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Temperature Converter'),
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
                  "Masukkan Suhu",
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
                value: seltemperaturesFrom,
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
                    seltemperaturesFrom = newValue;
                  });
                },
                items:
                    temperatures.map<DropdownMenuItem<String>>((String value) {
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
                value: seltemperaturesTo,
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
                    seltemperaturesTo = newValue;
                  });
                },
                items:
                    temperatures.map<DropdownMenuItem<String>>((String value) {
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
                        temperaturesAbr[
                            temperatures.indexOf(seltemperaturesFrom!)],
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
                        temperaturesAbr[
                            temperatures.indexOf(seltemperaturesTo!)],
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
