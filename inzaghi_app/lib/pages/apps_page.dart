import 'package:flutter/material.dart';
import 'package:inzaghi_app/widgets/navbar.dart';

class AppsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Apps'),
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
                          buildAppCard(context, Icons.calendar_month_outlined,
                              'Calendar System'),
                          buildAppCard(context, Icons.access_time_rounded,
                              'Clock & Time'),
                          buildAppCard(context, Icons.cloud, 'Weather'),
                          buildAppCard(context, Icons.currency_pound, 'Stocks'),
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
                          buildCardImages(
                              context, 'assets/icons/length.png', 'Length'),
                          buildCardImages(
                              context, 'assets/icons/weight.png', 'Weight'),
                          buildCardImages(
                              context, 'assets/icons/volume-cup.png', 'Volume'),
                          buildAppCard(context, Icons.area_chart, 'Area'),
                          buildAppCard(
                              context, Icons.access_time_filled_sharp, 'Time'),
                          buildAppCard(
                              context, Icons.thermostat_rounded, 'Temperature'),
                          buildAppCard(context, Icons.speed, 'Speed'),
                          buildAppCard(
                              context, Icons.currency_yen_sharp, 'Currency'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      buildButton(context, 'View All', '/converters.dart'),
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
                          buildAppCard(context, Icons.calculate, 'Standard'),
                          buildAppCard(context, Icons.science, 'Scientific'),
                          buildCardImages(context,
                              'assets/icons/fraction-half.png', 'Fraction'),
                          buildAppCard(context, Icons.percent, 'Modulus'),
                          buildAppCard(
                              context, Icons.abc, 'Mean, Mode, Median'),
                          buildAppCard(context, Icons.percent, 'Percentages'),
                          buildCardImages(context,
                              'assets/icons/investment.png', 'Investment'),
                          buildCardImages(
                              context, 'assets/icons/bmi.png', 'BMI Calc'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      buildButton(context, 'View All', '/calculators'),
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

  Widget buildAppCard(BuildContext context, IconData icon, String title) {
    return Card(
      margin: const EdgeInsets.all(2),
      elevation: 2,
      color: Colors.lightBlue[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: 80,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              const SizedBox(height: 10),
              Text(title, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardImages(BuildContext context, String imagePath, String title) {
    return Card(
      margin: const EdgeInsets.all(2),
      elevation: 2,
      color: Colors.lightBlue[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: 80,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 24, // Set the width of the image
                height: 24, // Set the height of the image
              ),
              const SizedBox(height: 10),
              Text(title, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, String label, String route) {
    return ElevatedButton(
      child: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
