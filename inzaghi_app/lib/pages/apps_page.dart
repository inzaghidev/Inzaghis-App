import 'package:flutter/material.dart';
import 'package:inzaghi_app/widgets/navbar.dart';
import 'package:inzaghi_app/widgets/button_cards.dart';

class AppsPage extends StatelessWidget {
  final ButtonCards buttonCards = ButtonCards();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Apps'),
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
                        'Widgets',
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
                          buttonCards.buildCardWithImagesIcon(
                              context,
                              Icons.calendar_month_outlined,
                              'Calendar System',
                              ''),
                          buttonCards.buildCardWithImagesIcon(context,
                              Icons.access_time_rounded, 'Clock & Time', ''),
                          buttonCards.buildCardWithImagesIcon(
                              context, Icons.cloud, 'Weather', ''),
                          buttonCards.buildCardWithImagesIcon(
                              context, Icons.currency_pound, 'Stocks', ''),
                        ],
                      ),
                      const SizedBox(height: 10),
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
                        'Converters',
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
                          buttonCards.buildCardWithImagesIcon(
                              context,
                              'assets/icons/length.png',
                              'Length',
                              '/length-conv'),
                          buttonCards.buildCardWithImagesIcon(
                              context,
                              'assets/icons/weight.png',
                              'Weight',
                              '/weight-conv'),
                          buttonCards.buildCardWithImagesIcon(
                              context, Icons.area_chart, 'Area', '/area-conv'),
                          buttonCards.buildCardWithImagesIcon(
                              context,
                              'assets/icons/volume-cup.png',
                              'Volume',
                              '/volume-conv'),
                          buttonCards.buildCardWithImagesIcon(
                              context,
                              Icons.access_time_filled_sharp,
                              'Time',
                              '/time-conv'),
                          buttonCards.buildCardWithImagesIcon(
                              context,
                              Icons.thermostat_rounded,
                              'Temperature',
                              '/temperature-conv'),
                          buttonCards.buildCardWithImagesIcon(
                              context, Icons.speed, 'Speed', '/speed-conv'),
                          buttonCards.buildCardWithImagesIcon(
                              context,
                              Icons.currency_yen_sharp,
                              'Currency',
                              '/currency-conv'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      buttonCards.buildButton(
                          context, 'View All', '/converters'),
                      const SizedBox(height: 10),
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
                        'Calculators',
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
                          buttonCards.buildCardWithImagesIcon(
                              context, Icons.calculate, 'Standard', ''),
                          buttonCards.buildCardWithImagesIcon(
                              context, Icons.science, 'Scientific', ''),
                          buttonCards.buildCardWithImagesIcon(context,
                              'assets/icons/fraction-half.png', 'Fraction', ''),
                          buttonCards.buildCardWithImagesIcon(
                              context, Icons.percent, 'Modulus', ''),
                          buttonCards.buildCardWithImagesIcon(
                              context, Icons.abc, 'Mean, Mode, Median', ''),
                          buttonCards.buildCardWithImagesIcon(
                              context, Icons.percent, 'Percentages', ''),
                          buttonCards.buildCardWithImagesIcon(context,
                              'assets/icons/investment.png', 'Investment', ''),
                          buttonCards.buildCardWithImagesIcon(
                              context, 'assets/icons/bmi.png', 'BMI Calc', ''),
                        ],
                      ),
                      const SizedBox(height: 20),
                      buttonCards.buildButton(
                          context, 'View All', '/calculators'),
                      const SizedBox(height: 10),
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
