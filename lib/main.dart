import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // fontFamily: 'Domine',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 243, 151, 65),
        ),
      ),
      title: "Shopping App",
      home: const HomePage(),
    );
  }
}
