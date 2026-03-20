import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/bmi_provider.dart';
import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const BMICalcApp());
}

class BMICalcApp extends StatelessWidget {
  const BMICalcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BMIProvider(),
      child: Consumer<BMIProvider>(
        builder: (context, provider, _) {
          return MaterialApp(
            title: 'BMI Calculator',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: provider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}