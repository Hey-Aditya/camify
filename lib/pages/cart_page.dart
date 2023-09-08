import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import '../global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    // final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart!",
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];

            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  cartItem['imageUrl'].toString(),
                ),
                radius: 30,
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      // return const Dialog(
                      //   child: Text(
                      //     "Are you sure you want to remove this product?",
                      //   ),
                      // );
                      return AlertDialog(
                        title: Text(
                          "Delete Product",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        content: const Text(
                          "Are you sure you want to remove this product?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              context.read<CartProvider>().removeProduct(cartItem);
                              // Provider.of<CartProvider>(context, listen: false)
                                  // .removeProduct(cartItem);
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Product deleted!",
                                  ),
                                  duration:
                                      Duration(seconds: 1, milliseconds: 500),
                                ),
                              );
                            },
                            child: const Text(
                              "Yes",
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("No"),
                          ),
                        ],
                        // titlePadding: const EdgeInsets.all(36),
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.delete_rounded,
                  color: Colors.red,
                ),
              ),
              title: Text(
                cartItem['title'].toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Model: ${cartItem['model']}",
              ),
            );
          },
        ),
      ),
    );
  }
}
