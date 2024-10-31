import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:laundromat_flutter/config/router/router.dart';
import 'package:laundromat_flutter/model/cart_model.dart';
import 'package:laundromat_flutter/service/shopping/cart_service.dart';
import 'package:laundromat_flutter/service/shopping/favorite_service.dart';

class Productlist extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  final FavoriteService favoriteController = Get.put(FavoriteService());

  final List<CartModel> products = [
    CartModel(
        name: 'Product 1',
        image: 'https://via.placeholder.com/200',
        price: '100',
        quantity: 1),
    CartModel(
        name: 'Product 2',
        image: 'https://via.placeholder.com/200',
        price: '150',
        quantity: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('TEST SHOP'),
            Container(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {
                      context.push(AppRouter.favoriteScreen);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      context.push(AppRouter.cartScreen);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: GridView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return _ProductItem(product: product);
          },
        ),
      ),
    );
  }

  Widget _ProductItem({required CartModel product}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.teal[50],
      child: LayoutBuilder(
        builder: (context, boxConstraints) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        product.image,
                        height: boxConstraints.maxHeight * 0.4,
                        width: boxConstraints.maxWidth * 0.8,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$${product.price}',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() {
                      bool isFavorite =
                          favoriteController.isFavorite(product.name);
                      return IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.redAccent,
                        ),
                        onPressed: () {
                          favoriteController.toggleFavorite(product.name);
                        },
                      );
                    }),
                    IconButton(
                      icon: const Icon(Icons.add_shopping_cart,
                          color: Colors.blueAccent),
                      onPressed: () {
                        cartController.addItem(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('${product.name} added to cart')),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
