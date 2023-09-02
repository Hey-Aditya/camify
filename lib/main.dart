import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        fontFamily: GoogleFonts.playfairDisplay().fontFamily,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 243, 151, 65),
          primary: Color.fromARGB(255, 243, 151, 65),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
          prefixIconColor: Color.fromRGBO(127, 127, 127, 1),
        ),
      ),
      title: "Shopping App",
      home: const HomePage(),
    );
  }
}
