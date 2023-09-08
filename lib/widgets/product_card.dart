import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image, required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    //try to use Card widget as it provides some elevation to the box.
    return Container(
      // color: Colors.cyan,
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        // gradient: ,
        // color: Colors.cyan,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 5),
          Text(
            "\$${price}",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 5),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                image,
                height: 275,
                // fit: ,
              ),
            ),
          ),
          // Image(
          //   image: AssetImage(image),
          //   height: 275,
          // ),
        ],
      ),
    );
  }
}
