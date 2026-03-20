import 'package:bmi_calc/screens/login_page_screen.dart';
import 'package:bmi_calc/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/bmi_provider.dart';
import '../utils/unit_converter.dart';
import '../widgets/bmi_gauge.dart';
import '../widgets/calculate_button.dart';
import '../widgets/height_input.dart';
import '../widgets/weight_input.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final height1 = TextEditingController();
  final height2 = TextEditingController();
  final weight = TextEditingController();

  String heightUnit = "cm";
  String weightUnit = "kg";void logout() async {
    final result = await showDialog<bool>(
      context: context, 
      builder: (_) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Do you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Logout'),
          ),
        ],
      ),
    );

    if (result != true) return;

    if (!mounted) return;
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setBool(SplashScreenState.islogin, false);

    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
        (route) => false,
      );
    }
  }



  double convertHeight() {
    double v1 = double.tryParse(height1.text) ?? 0;
    double v2 = double.tryParse(height2.text) ?? 0;

    switch (heightUnit) {
      case "ft_in":
        return UnitConverter.feetInchesToMeters(v1, v2);
      case "ft":
        return UnitConverter.feetToMeters(v1);
      case "in":
        return UnitConverter.inchesToMeters(v1);
      case "cm":
        return UnitConverter.cmToMeters(v1);
      case "m":
        return v1;
      default:
        return 0;
    }
  }

  double convertWeight() {
    double w = double.tryParse(weight.text) ?? 0;

    if (weightUnit == "t") {
      return UnitConverter.tonToKg(w);
    }
    return w;
  }

  void calculate() {
    final provider = context.read<BMIProvider>();

    double heightM = convertHeight();
    double weightKg = convertWeight();

    if (heightM <= 0 || weightKg <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter valid inputs")),
      );
      return;
    }

    provider.calculateBMI(heightM, weightKg);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BMIProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        actions: [
          IconButton(
            icon: const Icon(Icons.dark_mode),
            onPressed: () => provider.toggleTheme(),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: logout,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BMIGauge(bmi: provider.bmi),

            const SizedBox(height: 10),

            Text(
              provider.category,
              style: const TextStyle(fontSize: 22),
            ),

            Text(provider.suggestion),

            const SizedBox(height: 30),

            HeightInput(
              controller1: height1,
              controller2: height2,
              unit: heightUnit,
              onUnitChanged: (v) {
                setState(() => heightUnit = v!);
              },
            ),

            const SizedBox(height: 20),

            WeightInput(
              controller: weight,
              unit: weightUnit,
              onUnitChanged: (v) {
                setState(() => weightUnit = v!);
              },
            ),

            const SizedBox(height: 30),

            CalculateButton(
              onCalculate: calculate,
              onReset: () {
                height1.clear();
                height2.clear();
                weight.clear();
                provider.reset();
              },
            )
          ],
        ),
      ),
    );
  }
}