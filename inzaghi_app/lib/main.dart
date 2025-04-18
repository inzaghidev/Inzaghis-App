import 'package:flutter/material.dart';
import 'package:inzaghi_app/screens/home_page.dart';
import 'package:inzaghi_app/settings/about_page.dart';
import 'package:inzaghi_app/pages/apps_page.dart';
import 'package:inzaghi_app/pages/settings_page.dart';
import 'package:inzaghi_app/settings/profile.dart';

//=============================================================
//Basic Converters :
import 'package:inzaghi_app/pages/converters.dart';
import 'package:inzaghi_app/pages/converters/length-conv.dart';
import 'package:inzaghi_app/pages/converters/weight-conv.dart';
import 'package:inzaghi_app/pages/converters/area-conv.dart';
import 'package:inzaghi_app/pages/converters/volume-conv.dart';
import 'package:inzaghi_app/pages/converters/time-conv.dart';
import 'package:inzaghi_app/pages/converters/speed-conv.dart';
import 'package:inzaghi_app/pages/converters/temperature-conv.dart';
import 'package:inzaghi_app/pages/converters/currency-conv.dart';
import 'package:inzaghi_app/pages/converters/cryptocurrency-conv.dart';
import 'package:inzaghi_app/pages/converters/pressure-conv.dart';
import 'package:inzaghi_app/pages/converters/force-conv.dart';
import 'package:inzaghi_app/pages/converters/power-conv.dart';
import 'package:inzaghi_app/pages/converters/fuel-conv.dart';
import 'package:inzaghi_app/pages/converters/energy-conv.dart';
import 'package:inzaghi_app/pages/converters/angle-conv.dart';
import 'package:inzaghi_app/pages/converters/electricity-conv.dart';
import 'package:inzaghi_app/pages/converters/storagedata-conv.dart';
import 'package:inzaghi_app/pages/converters/numbersystem-conv.dart';

//Engineering Converters :
import 'package:inzaghi_app/pages/converters/velocity-conv.dart';
import 'package:inzaghi_app/pages/converters/acceleration-conv.dart';
import 'package:inzaghi_app/pages/converters/density-conv.dart';
import 'package:inzaghi_app/pages/converters/momentinertia-conv.dart';

//Electricity Converters :
import 'package:inzaghi_app/pages/converters/charge-conv.dart';
import 'package:inzaghi_app/pages/converters/linchargdenst-conv.dart';
import 'package:inzaghi_app/pages/converters/surchargdenst-conv.dart';
import 'package:inzaghi_app/pages/converters/volchargdenst-conv.dart';
import 'package:inzaghi_app/pages/converters/current-conv.dart';
import 'package:inzaghi_app/pages/converters/lincurrdenst-conv.dart';
import 'package:inzaghi_app/pages/converters/surcurrdenst-conv.dart';
import 'package:inzaghi_app/pages/converters/volcurrdenst-conv.dart';

//import 'package:inzaghi_app/pages/converters/elfieldstrength-conv.dart';
//import 'package:inzaghi_app/pages/converters/elpotential-conv.dart';
//import 'package:inzaghi_app/pages/converters/elresistance-conv.dart';
//import 'package:inzaghi_app/pages/converters/elresistivity-conv.dart';
//import 'package:inzaghi_app/pages/converters/elonductance-conv.dart';
//import 'package:inzaghi_app/pages/converters/elconsuctivity-conv.dart';

//=============================================================
import 'package:inzaghi_app/pages/calculators.dart';

import 'package:inzaghi_app/widgets/navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(), // Use Home widget as the main route
        '/about': (context) => AboutPage(),
        '/apps': (context) => AppsPage(),
        '/settings': (context) => SettingsPage(),
        '/converters': (context) => ConvertersPage(),
        '/calculators': (context) => CalculatorsPage(),
        '/profile': (context) => ProfilePage(),

        //======================================================

        //Basic Converters :
        '/length-conv': (context) => LengthConv(),
        '/weight-conv': (context) => WeightConv(),
        '/area-conv': (context) => AreaConv(),
        '/volume-conv': (context) => VolumeConv(),
        '/time-conv': (context) => TimeConv(),
        '/speed-conv': (context) => SpeedConv(),
        '/temperature-conv': (context) => TemperatureConv(),
        '/currency-conv': (context) => CurrencyConv(),
        '/cryptocurrency-conv': (context) => CryptoCurrencyConv(),
        '/pressure-conv': (context) => PressureConv(),
        '/force-conv': (context) => ForceConv(),
        '/power-conv': (context) => PowerConv(),
        '/fuel-conv': (context) => FuelConv(),
        '/energy-conv': (context) => EnergyConv(),
        '/angle-conv': (context) => AngleConv(),
        '/electricity-conv': (context) => ElectricityConv(),
        '/storagedata-conv': (context) => DataStorageConv(),
        '/numbersystem-conv': (context) => NumberSystemsConv(),

        //Engineering Converters :
        '/velocity-conv': (context) => VelocityConv(),
        '/acceleration-conv': (context) => AccelerationConv(),
        '/density-conv': (context) => DensityConv(),
        '/momentinertia-conv': (context) => MomentInertiaConv(),

        //Electricity Converters :
        '/charge-conv': (context) => ChargeConv(),
        '/linchargdenst-conv': (context) => LinearChargeDensityConv(),
        '/surchargdenst-conv': (context) => SurfaceChargeDensityConv(),
        '/volchargdenst-conv': (context) => VolumeChargeDensityConv(),
        '/current-conv': (context) => CurrentConv(),
        '/lincurrdenst-conv': (context) => LinearCurrentDensityConv(),
        '/surcurrdenst-conv': (context) => SurfaceCurrentDensityConv(),
        '/volcurrdenst-conv': (context) => VolumeCurrentDensityConv(),
        //'/elfieldstrength-conv': (context) => ElectricFieldStrengthConv(),
        //'/elpotential-conv': (context) => ElectricPotentialConv(),
        //'/elresistance-conv': (context) => ElectricResistanceConv(),
        //'/elresistivity-conv': (context) => ElectricResistivityConv(),
        //'/elonductance-conv': (context) => ElectricConductanceConv(),
        //'/elconsuctivity-conv': (context) => ElectricConductivityConv(),

        //======================================================

        //'/standard-calc': (context) => StandardCalc(),
        //'/scientific-calc': (context) => ScientificCalc(),

        // Add other routes here
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = const [
    Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Apps Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Settings Page', style: TextStyle(fontSize: 24))),
  ];

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onDestinationSelected,
      ),
    );
  }
}
