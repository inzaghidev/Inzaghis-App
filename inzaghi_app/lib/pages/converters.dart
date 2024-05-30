import 'package:flutter/material.dart';
import 'package:inzaghi_app/widgets/button_cards.dart';
import 'package:inzaghi_app/widgets/navbar.dart';

class ConvertersPage extends StatelessWidget {
  final ButtonCards buttonCards = ButtonCards();

  final List<dynamic> iconConvList = [
    'assets/icons/length.png',
    'assets/icons/weight.png',
    Icons.area_chart,
    'assets/icons/volume-cup.png',
    Icons.access_time_filled_sharp,
    Icons.speed,
    Icons.thermostat_rounded,
    Icons.power,
    Icons.currency_yen_sharp,
    Icons.currency_bitcoin,
    'assets/icons/pressure.png',
    'assets/icons/force-physics.png',
    'assets/icons/fuel-pump-icon.png',
    Icons.energy_savings_leaf_outlined,
    'assets/icons/angle-icon.png',
    Icons.electrical_services,
    'assets/icons/data-storage-icon.png',
    'assets/icons/number-system-binary.png',
  ];

  final List<String> titleConvList = [
    'Length',
    'Weight',
    'Area',
    'Volume',
    'Time',
    'Speed',
    'Temperature',
    'Power',
    'Currency',
    'Cryptocurrency',
    'Pressure',
    'Force',
    'Fuel Consumption',
    'Energy',
    'Angle',
    'Electricity',
    'Data Storage',
    'Number System',
  ];

  final List<String> routeConvList = [
    '/length-conv',
    '/weight-conv',
    '/area-conv',
    '/volume-conv',
    '/time-conv',
    '/speed-conv',
    '/temperature-conv',
    '/power-conv',
    '/currency-conv',
    '/cryptocurrency-conv',
    '/pressure-conv',
    '/force-conv',
    '/fuel-conv',
    '/energy-conv',
    '/angle-conv',
    '/electricity-conv',
    '/storagedata-conv',
    '/numbersystem-conv',
  ];

  final List<dynamic> iconEngerConvList = [
    'assets/icons/velocity.png',
    'assets/icons/acceleration-physics-symbol.png',
    Icons.density_small,
    'assets/icons/inertia-gyroscope-icon.png',
  ];

  final List<String> titleEngerConvList = [
    'Velocity (Angular)',
    'Acceleration',
    'Density',
    'Moment of Inertia',
  ];

  final List<String> routeEngerConvList = [
    '/velocity-conv',
    '/acceleration-conv',
    '/density-conv',
    '/momentinertia-conv',
  ];

  final List<dynamic> iconElectryConvList = [
    Icons.battery_charging_full_rounded,
    Icons.abc,
    Icons.abc,
    Icons.abc,
    Icons.electrical_services,
    Icons.abc,
    Icons.abc,
    Icons.abc,
    Icons.abc,
    Icons.abc,
    Icons.abc,
    Icons.abc,
  ];

  final List<String> titleElectryConvList = [
    'Electrical Charge',
    'Linear Charge Density',
    'Surface Charge Density',
    'Volume Charge Density',
    'Electrical Current',
    'Linear Current Density',
    'Surface Current Density',
    'Volume Current Density',
    'App',
    'App',
    'App',
    'App',
  ];

  final List<String> routeElectryConvList = [
    '/charge-conv',
    '/linchargdenst-conv',
    '/surchargdenst-conv',
    '/volchargdenst-conv',
    '/current-conv',
    '/lincurrdenst-conv',
    '/surcurrdenst-conv',
    '/volcurrdenst-conv',
    '/app-conv',
    '/app-conv',
    '/app-conv',
    '/app-conv',
  ];

  final List<dynamic> iconFluidConvList = [
    Icons.abc,
    Icons.abc,
    Icons.abc,
    Icons.abc,
  ];

  final List<String> titleFluidConvList = [
    'App',
    'App',
    'App',
    'App',
  ];

  final List<String> routeFluidConvList = [
    '/app-conv',
    '/app-conv',
    '/app-conv',
    '/app-conv',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Converters'),
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
                        'Basic Converters',
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
                        children: List.generate(iconConvList.length, (index) {
                          return buttonCards.buildCardWithImagesIcon(
                            context,
                            iconConvList[index],
                            titleConvList[index],
                            routeConvList[index],
                          );
                        }),
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
                        'Engineering Converters',
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
                            List.generate(iconEngerConvList.length, (index) {
                          return buttonCards.buildCardWithImagesIcon(
                            context,
                            iconEngerConvList[index],
                            titleEngerConvList[index],
                            routeEngerConvList[index],
                          );
                        }),
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
                        'Electricity Converters',
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
                            List.generate(iconElectryConvList.length, (index) {
                          return buttonCards.buildCardWithImagesIcon(
                            context,
                            iconElectryConvList[index],
                            titleElectryConvList[index],
                            routeElectryConvList[index],
                          );
                        }),
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
                        'Fluid Converters',
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
                            List.generate(iconFluidConvList.length, (index) {
                          return buttonCards.buildCardWithImagesIcon(
                            context,
                            iconFluidConvList[index],
                            titleFluidConvList[index],
                            routeFluidConvList[index],
                          );
                        }),
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
                        'Heat Converters',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Add widgets or cards for advanced converters here
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
