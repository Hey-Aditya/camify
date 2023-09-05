import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  double selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        // leading: const Icon(Icons.arrow_back_rounded),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Center(
            child: Text(
              widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                widget.product['imageUrl'] as String,
                scale: 2,
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.indigo.shade200,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text(
                  "\$${widget.product['price']}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['model'] as List<double>).length,
                    itemBuilder: (context, index) {
                      final size =
                          (widget.product['model'] as List<double>)[index];

                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            label: Text(
                              size.toString(),
                            ),
                            backgroundColor: selectedSize == size
                                ? Theme.of(context).colorScheme.primary
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  // child: ElevatedButton(
                  //   onPressed: () {
                  //     debugPrint("nahi karunga");
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     minimumSize: const Size(double.infinity, 50),
                  //     backgroundColor: Theme.of(context).colorScheme.primary,
                  //   ),
                  //   child:
                  //       // Icon(Icons.shopping_cart),
                  //     const Text(
                  //     "Add to Cart",
                  //     style: TextStyle(
                  //       fontSize: 16,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),

                  child: ElevatedButton.icon(
                    onPressed: () {
                      debugPrint("nahi karunga");
                    },
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black,
                    ),
                    label: const Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
