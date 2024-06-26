import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IconLabel {
  final String label;
  final IconData icon;

  const IconLabel(this.label, this.icon);
}

const List<String> cryptoCurrency = [
  'Bitcoin (BTC)',
  'Ethereum (ETH)',
  'Litecoin (LTC)',
  'Dogecoin (DOGE)',
  'Avalanche (AVAX)',
  'Binancecoin (BNB)',
];
const List<String> cryptoCurrencyAbr = [
  'BTC',
  'ETH',
  'LTC',
  'DOGE',
  'AVAX',
  'BNB',
];

class CryptoCurrencyConv extends StatefulWidget {
  const CryptoCurrencyConv({super.key});

  @override
  State<CryptoCurrencyConv> createState() => _CryptoCurrencyConvState();
}

class _CryptoCurrencyConvState extends State<CryptoCurrencyConv> {
  String? selcryptoCurrencyFrom = 'Bitcoin (BTC)';
  String? selcryptoCurrencyTo = 'Ethereum (ETH)';

  final TextEditingController inputValueController = TextEditingController();
  final TextEditingController outputValueController = TextEditingController();

  Map<String, double> exchangeRates = {};

  @override
  void initState() {
    super.initState();
    fetchExchangeRates();
  }

  Future<void> fetchExchangeRates() async {
    final response = await http.get(
        Uri.parse('https://api.coinbase.com/v2/exchange-rates?currency=BTC'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Data fetched: $data'); // Tambahkan ini untuk debugging
      setState(() {
        exchangeRates = Map<String, double>.from(data['data']['rates']
            .map((key, value) => MapEntry(key, double.parse(value))));
      });
    } else {
      throw Exception('Failed to load exchange rates');
    }
  }

  void convert() {
    final inputAmount = double.tryParse(inputValueController.text) ?? 0;
    final fromCurrency =
        cryptoCurrencyAbr[cryptoCurrency.indexOf(selcryptoCurrencyFrom!)];
    final toCurrency =
        cryptoCurrencyAbr[cryptoCurrency.indexOf(selcryptoCurrencyTo!)];

    print('From Currency: $fromCurrency');
    print('To Currency: $toCurrency');
    print('Input Amount: $inputAmount');
    print('Exchange Rates: $exchangeRates');

    if (exchangeRates.isNotEmpty) {
      final fromRate = exchangeRates[fromCurrency] ?? 1;
      final toRate = exchangeRates[toCurrency] ?? 1;

      print('From Rate: $fromRate');
      print('To Rate: $toRate');

      final convertedAmount = inputAmount * toRate / fromRate;

      setState(() {
        outputValueController.text = convertedAmount.toStringAsFixed(2);
      });

      print('Converted Amount: $convertedAmount');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE2F0),
      appBar: AppBar(
        title: const Text('Cryptocurrency Converter'),
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
                  "Masukkan Mata Uang Kripto",
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
                value: selcryptoCurrencyFrom,
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
                    selcryptoCurrencyFrom = newValue;
                  });
                },
                items: cryptoCurrency
                    .map<DropdownMenuItem<String>>((String value) {
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
                value: selcryptoCurrencyTo,
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
                    selcryptoCurrencyTo = newValue;
                  });
                },
                items: cryptoCurrency
                    .map<DropdownMenuItem<String>>((String value) {
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
                        cryptoCurrencyAbr[
                            cryptoCurrency.indexOf(selcryptoCurrencyFrom!)],
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
                        cryptoCurrencyAbr[
                            cryptoCurrency.indexOf(selcryptoCurrencyTo!)],
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
