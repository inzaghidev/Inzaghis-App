import 'package:flutter/material.dart';

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

const List<String> numberSystem = [
  'Binary (Base-2)',
  'Quaternary (Base-4)',
  'Octal (Base-8)',
  'Decimal (Base-10)',
  'Hexadecimal (Base-16)',
  'Vigesimal (Base-20)',
];
const List<String> numberSystemAbr = [
  'BIN',
  'QUD/B4',
  'OCT',
  'DEC',
  'HEX',
  'VIG/B20',
];

/// Maps each number-system label to its numeric radix (base).
const Map<String, int> numberSystemRadix = {
  'Binary (Base-2)': 2,
  'Quaternary (Base-4)': 4,
  'Octal (Base-8)': 8,
  'Decimal (Base-10)': 10,
  'Hexadecimal (Base-16)': 16,
  'Vigesimal (Base-20)': 20,
};

class NumberSystemsConv extends StatefulWidget {
  const NumberSystemsConv({super.key});

  @override
  State<NumberSystemsConv> createState() => _NumberSystemsConvState();
}

class _NumberSystemsConvState extends State<NumberSystemsConv> {
  String? selnumberSystemFrom = 'Decimal (Base-10)';
  String? selnumberSystemTo = 'Binary (Base-2)';

  final TextEditingController inputValueController = TextEditingController();
  final TextEditingController outputValueController = TextEditingController();

  String? _errorText;

  /// Returns the radix for a given number-system label, defaulting to 10.
  int _radixOf(String? label) => numberSystemRadix[label ?? ''] ?? 10;

  void convert() {
    final input = inputValueController.text.trim();

    if (input.isEmpty) {
      setState(() {
        _errorText = 'Please enter a value to convert.';
        outputValueController.text = '';
      });
      return;
    }

    final fromRadix = _radixOf(selnumberSystemFrom);
    final toRadix = _radixOf(selnumberSystemTo);

    try {
      // Parse the input number using the source radix, then convert to target.
      final decimalValue = int.parse(input.toLowerCase(), radix: fromRadix);
      final result = decimalValue.toRadixString(toRadix).toUpperCase();

      setState(() {
        _errorText = null;
        outputValueController.text = result;
      });
    } catch (_) {
      setState(() {
        _errorText =
            'Invalid input for ${selnumberSystemFrom ?? 'selected base'}.\n'
            'Only digits valid in that base are allowed.';
        outputValueController.text = '';
      });
    }
  }

  String get _abrTo {
    final idx = numberSystem.indexOf(selnumberSystemTo ?? '');
    return idx >= 0 ? numberSystemAbr[idx] : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Number System Converter'),
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
                  "Masukkan Sistem Bilangan",
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
                value: selnumberSystemFrom,
                hint: const Text('Select Base'),
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
                    selnumberSystemFrom = newValue;
                    // Clear output and error when base changes
                    outputValueController.text = '';
                    inputValueController.text = '';
                    _errorText = null;
                  });
                },
                items:
                    numberSystem.map<DropdownMenuItem<String>>((String value) {
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
                value: selnumberSystemTo,
                hint: const Text('Select Base'),
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
                    selnumberSystemTo = newValue;
                    // Clear output and error when target base changes
                    outputValueController.text = '';
                    _errorText = null;
                  });
                },
                items:
                    numberSystem.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: inputValueController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Input Nilai',
                  errorText: _errorText,
                  hintText:
                      'Enter value in ${selnumberSystemFrom ?? 'selected base'}',
                ),
                // visiblePassword allows letters (A–F for hex, etc.)
                keyboardType: TextInputType.visiblePassword,
                textCapitalization: TextCapitalization.characters,
                onChanged: (_) {
                  // Clear error as the user types
                  if (_errorText != null) {
                    setState(() => _errorText = null);
                  }
                },
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: convert,
                  icon: const Icon(Icons.swap_horiz),
                  label: const Text('Convert'),
                ),
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
                      enabled: false,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3, // 15% width
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        _abrTo,
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
