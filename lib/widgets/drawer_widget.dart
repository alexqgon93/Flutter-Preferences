import 'package:flutter/material.dart';
import 'package:preferences_app/screens/screens.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DraweHeader(),
          ListTile(
            leading: const Icon(Icons.pages_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.people_alt_outlined),
            title: const Text('People'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(
                  context, SettingsScreens.routeName);
            },
          )
        ],
      ),
    );
  }
}

class _DraweHeader extends StatelessWidget {
  const _DraweHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            image: const DecorationImage(
                image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover)),
        child: Container());
  }
}
