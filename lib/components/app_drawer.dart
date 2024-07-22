import 'package:flutter/material.dart';
import 'package:flutter_device_status/themes/text_theme.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          DrawerHeader(
            child: Icon(
              Icons.smart_screen_rounded,
              size: 40,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: ListTile(
              title: Text(
                'HOME',
                style: drawerTextTheme,
              ),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: ListTile(
              title: Text(
                'SETTINGS',
                style: drawerTextTheme,
              ),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ),
        ],
      ),
    );
  }
}
