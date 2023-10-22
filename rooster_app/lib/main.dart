import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rooster_app/providers/apartaments_provider.dart';
import 'package:rooster_app/screens/login_screen/login_page.dart';
import 'package:rooster_app/theme/light_theme.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ApartamentsProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: lightMode, home: const LoginPage());
  }
}
