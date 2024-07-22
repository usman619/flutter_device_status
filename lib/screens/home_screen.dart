import 'package:flutter/material.dart';
import 'package:flutter_device_status/components/app_drawer.dart';
import 'package:flutter_device_status/themes/text_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: Text(
            'HOME',
            style: titleTextTheme,
          ),
          centerTitle: true,
        ),
        drawer: const AppDrawer(),
        body: Center(
          child: Text('Home', style: bodyTextTheme),
        ));
  }
}
