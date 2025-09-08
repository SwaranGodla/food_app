import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/models/restaurant_model.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Mock data for restaurants
  final List<RestaurantModel> _popularRestaurants = [
    RestaurantModel(
      id: '1',
      name: 'The Golden Spoon',
      imageUrl: 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4',
      cuisine: 'Italian',
      rating: 4.5,
      deliveryTime: '20-30 min',
      distance: '2.5 km',
      menu: [],
    ),
    RestaurantModel(
      id: '2',
      name: 'Dragonfly Sushi',
      imageUrl: 'https://images.unsplash.com/photo-1553621042-f6e147245754',
      cuisine: 'Japanese',
      rating: 4.8,
      deliveryTime: '25-35 min',
      distance: '3.1 km',
      menu: [],
    ),
    RestaurantModel(
      id: '3',
      name: 'Taco Fiesta',
      imageUrl: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38',
      cuisine: 'Mexican',
      rating: 4.2,
      deliveryTime: '15-25 min',
      distance: '1.8 km',
      menu: [],
    ),
  ];

  final List<RestaurantModel> _trendingRestaurants = [
    RestaurantModel(
      id: '4',
      name: 'Burger Bliss',
      imageUrl: 'https://images.unsplash.com/photo-1571091718767-18b5b1457add',
      cuisine: 'American',
      rating: 4.6,
      deliveryTime: '20-30 min',
      distance: '2.2 km',
      menu: [],
    ),
    RestaurantModel(
      id: '5',
      name: 'Curry Kingdom',
      imageUrl: 'https://images.unsplash.com/photo-1589302168068-964664d93dc0',
      cuisine: 'Indian',
      rating: 4.7,
      deliveryTime: '30-40 min',
      distance: '4.5 km',
      menu: [],
    ),
  ];

  final List<Map<String, dynamic>> _categories = [
    {'name': 'Pizza', 'icon': Icons.local_pizza},
    {'name': 'Burgers', 'icon': Icons.fastfood},
    {'name': 'Sushi', 'icon': Icons.restaurant},
    {'name': 'Desserts', 'icon': Icons.cake},
    {'name': 'Salads', 'icon': Icons.grass},
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Deliver to',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF666666),
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 18,
                  color: Color(0xFF2196F3),
                ),
                const SizedBox(width: 4),
                const Text(
                  'San Francisco, CA',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                  color: Color(0xFF1A1A1A),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Color(0xFF1A1A1A),
            ),
            onPressed: () => context.go('/cart'),
          ),
          IconButton(
            icon: const Icon(
              Icons.person_outline,
              color: Color(0xFF1A1A1A),
            ),
            onPressed: () => context.go('/profile'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            _buildSearchBar(),

            const SizedBox(height: 24),

            // Categories
            _buildSectionTitle('Categories'),
            const SizedBox(height: 16),
            _buildCategoryList(),

            const SizedBox(height: 24),

            // Popular Restaurants
            _buildSectionTitle('Popular Near You'),
            const SizedBox(height: 16),
            _buildRestaurantList(_popularRestaurants),

            const SizedBox(height: 24),

            // Trending Restaurants
            _buildSectionTitle('Trending This Week'),
            const SizedBox(height: 16),
            _buildRestaurantList(_trendingRestaurants),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFF1A1A1A),
        ),
        decoration: const InputDecoration(
          hintText: 'Search for restaurants or dishes...',
          hintStyle: TextStyle(color: Color(0xFFBBBBBB)),
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xFF2196F3),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16),
        ),
        onTap: () => context.go('/search'),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1A1A1A),
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          return Container(
            width: 80,
            margin: const EdgeInsets.only(right: 16),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2196F3).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    category['icon'] as IconData,
                    color: const Color(0xFF2196F3),
                    size: 30,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  category['name'] as String,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF666666),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRestaurantList(List<RestaurantModel> restaurants) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];
          return _buildRestaurantCard(restaurant);
        },
      ),
    );
  }

  Widget _buildRestaurantCard(RestaurantModel restaurant) {
    return GestureDetector(
      onTap: () {
        context.go('/restaurant/${restaurant.id}');
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 16),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                restaurant.imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 120,
                    color: Colors.grey[200],
                    child: const Icon(
                      Icons.restaurant,
                      color: Colors.grey,
                      size: 40,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    restaurant.cuisine,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF666666),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        restaurant.rating.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.delivery_dining,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        restaurant.deliveryTime,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF666666),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}