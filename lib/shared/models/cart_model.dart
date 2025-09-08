class CartModel {
  final String id;
  final String userId;
  final String restaurantId;
  final List<CartItemModel> items;
  final double deliveryFee;
  final double tax;

  CartModel({
    required this.id,
    required this.userId,
    required this.restaurantId,
    required this.items,
    required this.deliveryFee,
    required this.tax,
  });

  bool get isEmpty => items.isEmpty;
  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);
  
  double get subtotal => items.fold(0.0, (sum, item) => sum + item.totalPrice);
  double get total => subtotal + deliveryFee + tax;
}

class CartItemModel {
  final String id;
  final String menuItemId;
  final String name;
  final String imageUrl;
  final double price;
  final int quantity;

  CartItemModel({
    required this.id,
    required this.menuItemId,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  double get totalPrice => price * quantity;
}