import 'package:flutter/material.dart';
import 'package:preferences_app/provider/theme_provider.dart';
import 'package:preferences_app/screens/home_screen.dart';
import 'package:preferences_app/screens/settings_screens.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(isDarkMode: Preferences.isDarkMode),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Preferences',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SettingsScreens.routeName: (_) => const SettingsScreens(),
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
