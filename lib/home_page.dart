import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Camify!",
          style: GoogleFonts.getFont(
            'Playfair Display',
            fontSize: 48,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),

        // child: Text(
        //   "Foodify",
        //   style: TextStyle(
        //     fontFamily: 'Domine',
        //     fontSize: 56,
        //     // fontWeight: FontWeight.w700
        //   ),
        // ),
      ),
    );
  }
}
