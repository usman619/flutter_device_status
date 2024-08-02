import 'package:flutter/material.dart';
import 'package:flutter_device_status/screens/home_screen.dart';
import 'package:flutter_device_status/screens/settings_screen.dart';
import 'package:flutter_device_status/themes/theme_provider.dart';
import 'package:flutter_device_status/widgets/circular_indicator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/home': (context) => const HomeScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
      // home: const Testing(),
      home: const HomeScreen(),
    );
  }
}
