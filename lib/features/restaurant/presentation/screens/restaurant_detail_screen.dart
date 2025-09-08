import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/models/restaurant_model.dart';

class RestaurantDetailScreen extends ConsumerWidget {
  final String restaurantId;

  RestaurantDetailScreen({super.key, required this.restaurantId});

  // Mock data for a single restaurant
  final RestaurantModel _restaurant = RestaurantModel(
    id: '1',
    name: 'The Golden Spoon',
    imageUrl: 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4',
    cuisine: 'Italian',
    rating: 4.5,
    deliveryTime: '20-30 min',
    distance: '2.5 km',
    menu: [
      MenuItemModel(
        id: '101',
        name: 'Margherita Pizza',
        description: 'Classic pizza with fresh mozzarella, tomatoes, and basil.',
        price: 12.99,
        imageUrl: 'https://images.unsplash.com/photo-1593560708920-61dd98c46a4e',
        category: 'Main Course',
      ),
      MenuItemModel(
        id: '102',
        name: 'Spaghetti Carbonara',
        description: 'Creamy pasta with pancetta, eggs, and Parmesan cheese.',
        price: 14.50,
        imageUrl: 'https://images.unsplash.com/photo-1612874742237-6526221588e3',
        category: 'Main Course',
      ),
      MenuItemModel(
        id: '103',
        name: 'Tiramisu',
        description: 'Classic Italian dessert with coffee, mascarpone, and cocoa.',
        price: 7.99,
        imageUrl: 'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9',
        category: 'Desserts',
      ),
    ],
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: CustomScrollView(
        slivers: [
          // App Bar with Restaurant Image
          _buildSliverAppBar(context),

          // Restaurant Info
          SliverToBoxAdapter(
            child: _buildRestaurantInfo(),
          ),

          // Menu
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final menuItem = _restaurant.menu[index];
                return _buildMenuItem(menuItem);
              },
              childCount: _restaurant.menu.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.go('/cart');
        },
        label: const Text('View Cart'),
        icon: const Icon(Icons.shopping_cart),
        backgroundColor: const Color(0xFF2196F3),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.0,
      pinned: true,
      backgroundColor: const Color(0xFF2196F3),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          _restaurant.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        background: Image.network(
          _restaurant.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[200],
              child: const Icon(
                Icons.restaurant,
                color: Colors.grey,
                size: 60,
              ),
            );
          },
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: () {
            // Add to favorites
          },
        ),
      ],
    );
  }

  Widget _buildRestaurantInfo() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _restaurant.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _restaurant.cuisine,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF666666),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 20),
              const SizedBox(width: 4),
              Text(
                '${_restaurant.rating} (120 reviews)',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.access_time, color: Colors.grey, size: 20),
              const SizedBox(width: 4),
              Text(
                _restaurant.deliveryTime,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(MenuItemModel menuItem) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            child: Image.network(
              menuItem.imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 100,
                  width: 100,
                  color: Colors.grey[200],
                  child: const Icon(
                    Icons.fastfood,
                    color: Colors.grey,
                    size: 40,
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menuItem.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    menuItem.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF666666),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${menuItem.price}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2196F3),
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.add_circle,
              color: Color(0xFF2196F3),
              size: 30,
            ),
            onPressed: () {
              // Add to cart
            },
          ),
        ],
      ),
    );
  }
}
