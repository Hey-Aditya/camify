// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
// import 'package:shop_app/global_variables.dart';
// import 'package:shop_app/pages/product_details_page.dart';
import 'pages/home_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      // create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          // fontFamily: GoogleFonts.playfairDisplay().fontFamily,
          // fontFamily: "Domine",
          fontFamily: GoogleFonts.dmSerifDisplay().fontFamily,
          // fontFamily: "SF Pro",
          // fontFamily: 'Coolvetica',
          // fontFamily: GoogleFonts.inter().fontFamily,

          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 243, 151, 65),
            primary: const Color.fromARGB(255, 243, 151, 65),
          ),

          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              fontFamily: GoogleFonts.dmSerifDisplay().fontFamily,
              color: Colors.black87,
            ),
            centerTitle: true,
          ),

          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
            prefixIconColor: Color.fromRGBO(127, 127, 127, 1),
          ),

          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            bodyMedium: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
          ),
        ),
        title: "Shopping App",
        home: AnimatedSplashScreen(
          splash: Icon(
            Icons.flutter_dash,
            color: Colors.indigo.shade200,
            size: 150,
          ),
          backgroundColor: Colors.indigo.shade600,
          nextScreen: const HomePage(),
          splashTransition: SplashTransition.scaleTransition,
          
          //! this is not working fix this.
          pageTransitionType: PageTransitionType.bottomToTopPop,
          duration: 500,
          animationDuration: const Duration(seconds: 2),
        ),
      ),
    );
  }
}
