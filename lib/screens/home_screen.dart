import 'package:flutter/material.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Settings'),
        elevation: 10,
      ),
      drawer: const DrawerWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('isDarkMode: ${Preferences.isDarkMode}'),
          const Divider(),
          Text(
              'Type of user: ${Preferences.typeUser == 1 ? 'Admin' : 'Normal User'}'),
          const Divider(),
          Text('UserName: ${Preferences.name}'),
        ],
      ),
    );
  }
}
