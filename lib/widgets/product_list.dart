import 'package:flutter/material.dart';
import "package:shop_app/global_variables.dart";
import 'package:shop_app/widgets/product_card.dart';
import 'package:shop_app/pages/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
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
    // final size = MediaQuery.of(context).size;
    final size = MediaQuery.sizeOf(context);
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  "Camera\nCollection.",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),

              // SizedBox(
              //   width: 200,
              //   child: TextField(),
              // ),

              const Expanded(
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
                      setState(() {
                        selectedFilter = filter;
                      });
                      debugPrint("tapped...");
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

          // const Stack(
          //   children: [
          //     Text("delusional"),
          //     Text("daydreaming"),
          //   ],
          // ),

          // Expanded(
          //   child: GridView.builder(
          //     itemCount: products.length,
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //     ),
          //     itemBuilder: (context, index) {
          //       final product = products[index];
          //       return GestureDetector(
          //         onTap: () {
          //           Navigator.of(context).push(
          //             MaterialPageRoute(
          //               builder: (context) {
          //                 return ProductDetailsPage(product: product);
          //               },
          //             ),
          //           );
          //         },
          //         child: ProductCard(
          //           // title: "chal hatt.",
          //           // price: 48.95,
          //           // image: product['imageUrl'] as String,
          //           // backgroundColor: Colors.cyan.shade200,

          //           title: product['title'] as String,
          //           price: product['price'] as double,
          //           image: product['imageUrl'] as String,
          //           backgroundColor: index.isEven
          //               ? Colors.indigo.shade200
          //               : Colors.grey.shade300,
          //         ),
          //       );
          //     },
          //   ),
          // ),

          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // print(constraints.maxHeight);
                // print(constraints.maxWidth);
                // print(constraints.minHeight);
                // print(constraints.minWidth);
                // return Text("Flutter Dev");

                print(constraints.maxHeight);
                print(constraints.maxWidth);
                if (constraints.maxWidth > 1080) {
                  return GridView.builder(                    
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetailsPage(product: product);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                          // title: "chal hatt.",
                          // price: 48.95,
                          // image: product['imageUrl'] as String,
                          // backgroundColor: Colors.cyan.shade200,

                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['imageUrl'] as String,
                          backgroundColor: index.isEven
                              ? Colors.indigo.shade200
                              : Colors.grey.shade300,
                        ),
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetailsPage(product: product);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                          // title: "chal hatt.",
                          // price: 48.95,
                          // image: product['imageUrl'] as String,
                          // backgroundColor: Colors.cyan.shade200,

                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['imageUrl'] as String,
                          backgroundColor: index.isEven
                              ? Colors.indigo.shade200
                              : Colors.grey.shade300,
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),

          // Expanded(
          //     child: GridView.builder(
          //   itemCount: products.length,
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     childAspectRatio: 1.5,
          //   ),
          //   itemBuilder: (context, index) {
          //     final product = products[index];
          //     return GestureDetector(
          //       onTap: () {
          //         Navigator.of(context).push(
          //           MaterialPageRoute(
          //             builder: (context) {
          //               return ProductDetailsPage(product: product);
          //             },
          //           ),
          //         );
          //       },
          //       child: ProductCard(
          //         // title: "chal hatt.",
          //         // price: 48.95,
          //         // image: product['imageUrl'] as String,
          //         // backgroundColor: Colors.cyan.shade200,

          //         title: product['title'] as String,
          //         price: product['price'] as double,
          //         image: product['imageUrl'] as String,
          //         backgroundColor: index.isEven
          //             ? Colors.indigo.shade200
          //             : Colors.grey.shade300,
          //       ),
          //     );
          //   },
          // )
          // ListView.builder(
          //     itemCount: products.length,
          //     itemBuilder: (context, index) {
          //       final product = products[index];
          //       return GestureDetector(
          //         onTap: () {
          //           Navigator.of(context).push(
          //             MaterialPageRoute(
          //               builder: (context) {
          //                 return ProductDetailsPage(product: product);
          //               },
          //             ),
          //           );
          //         },
          //         child: ProductCard(
          //           // title: "chal hatt.",
          //           // price: 48.95,
          //           // image: product['imageUrl'] as String,
          //           // backgroundColor: Colors.cyan.shade200,

          //           title: product['title'] as String,
          //           price: product['price'] as double,
          //           image: product['imageUrl'] as String,
          //           backgroundColor: index.isEven
          //               ? Colors.indigo.shade200
          //               : Colors.grey.shade300,
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
