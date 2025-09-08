class RestaurantModel {
  final String id;
  final String name;
  final String imageUrl;
  final String cuisine;
  final double rating;
  final String deliveryTime;
  final String distance;
  final List<MenuItemModel> menu;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.cuisine,
    required this.rating,
    required this.deliveryTime,
    required this.distance,
    required this.menu,
  });
}

class MenuItemModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;

  MenuItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
  });

  double get discountPercentage => 0.0; // Default no discount
}