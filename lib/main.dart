import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portofolio',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 141, 237, 188),
          secondary: const Color.fromARGB(255, 122, 81, 81),
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
