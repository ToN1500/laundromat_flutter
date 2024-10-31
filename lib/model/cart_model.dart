class CartModel {
  final String name;
  final String image;
  final String price;
  int quantity = 1;

  CartModel({required this.name, required this.image, required this.price, required this.quantity});
}
