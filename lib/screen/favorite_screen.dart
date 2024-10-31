import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundromat_flutter/model/cart_model.dart';
import 'package:laundromat_flutter/service/shopping/favorite_service.dart';

  final List<CartModel> products = [
    CartModel(name: 'Product 1', image: 'https://via.placeholder.com/200', price: '100', quantity: 1),
    CartModel(name: 'Product 2', image: 'https://via.placeholder.com/200', price: '150', quantity: 1),
  ];

class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final FavoriteService _favoriteController = Get.put(FavoriteService());
  @override
  void initState() {
    // TODO: implement initState
    _favoriteController.getFavorites();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Obx(() {
        if (_favoriteController.favoriteProducts.isEmpty) {
          return Center(child: Text('No favorites yet.'));
        }
        return ListView.builder(
          itemCount: _favoriteController.favoriteProducts.length,
          itemBuilder: (context, index) {
            final product = _favoriteController.favoriteProducts[index];
            return ListTile(
              leading: Image.network(product.image, width: 50, height: 50),
              title: Text(product.name),
              subtitle: Text('\$${product.price}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  _favoriteController.toggleFavorite(product.name);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
