// controllers/cart_controller.dart
import 'package:get/get.dart';
import 'package:laundromat_flutter/model/cart_model.dart';

class CartController extends GetxController {
  var cartItems = <CartModel>[].obs;

  double get totalAmount {
    return cartItems.fold(0.0, (sum, item) => sum + (double.parse(item.price) * item.quantity));
  }

  void addItem(CartModel item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.name == item.name);
    if (index != -1) {
      cartItems[index].quantity++;
      cartItems.refresh();
    } else {
      cartItems.add(item);
    }
  }
  void delItem(CartModel item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.name == item.name);
    if (index != -1) {
      cartItems[index].quantity++;
      cartItems.refresh();
    } else {
      cartItems.add(item);
    }
  }

  void removeItem(String name) {
    cartItems.removeWhere((item) => item.name == name);
  }

  void clearCart() {
    cartItems.clear();
  }
}
