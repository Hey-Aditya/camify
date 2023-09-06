import 'package:flutter/material.dart';
import 'global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
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
