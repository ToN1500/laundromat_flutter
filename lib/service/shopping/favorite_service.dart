// controllers/favorite_service.dart
import 'package:get/get.dart';
import 'package:laundromat_flutter/model/cart_model.dart';
import 'package:laundromat_flutter/screen/favorite_screen.dart';

class FavoriteService extends GetxController {
  var favorites = <String>{}.obs;
  final RxList<CartModel> favoriteProducts = <CartModel>[].obs;

  void getFavorites() {
    favoriteProducts.value =
        products.where((product) => isFavorite(product.name)).toList();
  }

  void toggleFavorite(String name) {
    if (favorites.contains(name)) {
      favorites.remove(name);
    } else {
      favorites.add(name);
    }
  }

  bool isFavorite(String name) {
    return favorites.contains(name);
  }
}
