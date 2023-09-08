import "package:flutter/material.dart";
import 'package:shop_app/pages/cart_page.dart';
import 'package:shop_app/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> pages = const [
    ProductList(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   // child: Text(
      //   //   "Camify!",
      //   //   style: GoogleFonts.getFont(
      //   //     'Playfair Display',
      //   //     fontSize: 48,
      //   //     fontStyle: FontStyle.italic,
      //   //     fontWeight: FontWeight.bold,
      //   //   ),
      //   // ),

      //   child: Text(
      //     "Pacify!",
      //     style: TextStyle(
      //       fontSize: 48,
      //       fontStyle: FontStyle.italic,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),

      //   // child: Text(
      //   //   "Foodify",
      //   //   style: TextStyle(
      //   //     fontFamily: 'Domine',
      //   //     fontSize: 56,
      //   //     // fontWeight: FontWeight.w700
      //   //   ),
      //   // ),

      // ),

      // body: currentPage == 0 ? ProductList() : CartPage(),
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
            tooltip: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
            tooltip: "Cart",
          ),
        ],
      ),
    );
  }
}
