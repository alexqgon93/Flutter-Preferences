import 'package:flutter/material.dart';
import 'package:preferences_app/provider/theme_provider.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreens extends StatefulWidget {
  static const String routeName = '/settings';

  const SettingsScreens({super.key});

  @override
  State<SettingsScreens> createState() => _SettingsScreensState();
}

class _SettingsScreensState extends State<SettingsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          elevation: 10,
        ),
        drawer: const DrawerWidget(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Settings',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
                ),
                const Divider(),
                SwitchListTile.adaptive(
                    value: Preferences.isDarkMode,
                    title: const Text('DarkMode'),
                    onChanged: (value) {
                      Preferences.isDarkMode = value;
                      final themeProvider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      value
                          ? themeProvider.setDardMode()
                          : themeProvider.setLigthMode();
                      setState(() {});
                    }),
                const Divider(),
                RadioListTile<int>(
                    value: 1,
                    groupValue: Preferences.typeUser,
                    title: const Text('Admin'),
                    onChanged: (value) {
                      Preferences.typeUser = value ?? 1;
                      setState(() {});
                    }),
                RadioListTile<int>(
                    value: 2,
                    groupValue: Preferences.typeUser,
                    title: const Text('Normal User'),
                    onChanged: (value) {
                      Preferences.typeUser = value ?? 2;
                      setState(() {});
                    }),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    onChanged: (value) {
                      Preferences.name = value;
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                      helperText: 'Name should be at least 3 characters',
                    ),
                    initialValue: Preferences.name,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
