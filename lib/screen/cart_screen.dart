// screens/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundromat_flutter/model/cart_model.dart';
import 'package:laundromat_flutter/service/shopping/cart_service.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (cartController.cartItems.isEmpty) {
                return const Center(child: Text('Your cart is empty'));
              }
              return ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final CartModel item = cartController.cartItems[index];
                  return ListTile(
                    leading: Image.network(item.image, width: 50, height: 50),
                    title: Text(item.name),
                    subtitle: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => cartController.removeItem(item.name),
                        ),
                        Text('จำนวน: ${item.quantity}'),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => cartController.addItem(item),
                        ),
                      ],
                    ),
                    trailing: Text(
                        '\$${(double.parse(item.price) * item.quantity).toStringAsFixed(2)}'),
                    onLongPress: () => cartController.removeItem(item.name),
                  );
                },
              );
            }),
          ),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Total: \$${cartController.totalAmount.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: cartController.cartItems.isNotEmpty
                        ? () {
                            cartController.clearCart();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Order placed successfully!')),
                            );
                          }
                        : null,
                    child: const Text('Checkout'),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
