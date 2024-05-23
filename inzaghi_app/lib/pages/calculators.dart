import 'package:flutter/material.dart';
import 'package:inzaghi_app/widgets/button_cards.dart';
import 'package:inzaghi_app/widgets/navbar.dart';

class CalculatorsPage extends StatelessWidget {
  final ButtonCards buttonCards = ButtonCards();

  final List<dynamic> iconMathCalcList = [
    Icons.abc,
    Icons.abc,
    Icons.abc,
    Icons.abc,
  ];

  final List<String> titleMathCalcList = [
    'App',
    'App',
    'App',
    'App',
  ];

  final List<String> routeMathCalcList = [
    '/app-calc',
    '/app-calc',
    '/app-calc',
    '/app-calc',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Calculators'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                margin: const EdgeInsets.all(10),
                color: Colors.white54,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Simple & Scientific Calculators',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          buttonCards.buildCardWithImagesIcon(context,
                              Icons.calculate, 'Standard', '/standard-calc'),
                          buttonCards.buildCardWithImagesIcon(context,
                              Icons.science, 'Scientific', '/scientific-calc'),
                        ],
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Card(
                margin: const EdgeInsets.all(10),
                color: Colors.white54,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Math Calculators',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 10,
                        runSpacing: 10,
                        children:
                            List.generate(iconMathCalcList.length, (index) {
                          return buttonCards.buildCardWithImagesIcon(
                            context,
                            iconMathCalcList[index],
                            titleMathCalcList[index],
                            routeMathCalcList[index],
                          );
                        }),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: 1,
        onDestinationSelected: (int value) {
          final List<String> routes = ['/', '/apps', '/settings'];
          Navigator.pushNamed(context, routes[value]);
        },
      ),
    );
  }
}
