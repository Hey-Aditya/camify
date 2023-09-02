import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const [
    'All',
    'Fujifilm',
    'Lumix',
    'Kodak',
    'Pentax'
  ];
  late String selectedFilter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );

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

      body: SafeArea(
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text(
                    "Camera\nCollection.",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),

                // SizedBox(
                //   width: 200,
                //   child: TextField(),
                // ),

                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      // focusedBorder: border,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 72,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        debugPrint("tapped...");
                        selectedFilter = filter;
                      },
                      child: Chip(
                        label: Text(filter),
                        labelStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          // fontStyle: FontStyle.italic,
                          color: Colors.black54,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        side: BorderSide.none,
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey.shade300,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
