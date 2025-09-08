import 'package:flutter/material.dart';

class AppConstants {
  // App Info
  static const String appName = 'FoodApp';
  static const String appVersion = '1.0.0';
  
  // API Configuration
  static const String baseUrl = 'https://api.foodapp.com/v1';
  static const String apiKey = 'your_api_key_here';
  static const int connectionTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds
  
  // Storage Keys
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';
  static const String cartKey = 'cart_data';
  static const String favoritesKey = 'favorites_data';
  static const String settingsKey = 'app_settings';
  
  // Animation Durations
  static const Duration splashDuration = Duration(seconds: 3);
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration shortAnimationDuration = Duration(milliseconds: 150);
  
  // Pagination
  static const int pageSize = 20;
  static const int maxRetries = 3;
  
  // Validation
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 50;
  static const int minPhoneLength = 10;
  static const int maxPhoneLength = 15;
  
  // Location
  static const double defaultLatitude = 37.7749;
  static const double defaultLongitude = -122.4194;
  static const double maxDeliveryDistance = 50.0; // km
  
  // Order Status
  static const String orderPending = 'pending';
  static const String orderConfirmed = 'confirmed';
  static const String orderPreparing = 'preparing';
  static const String orderOutForDelivery = 'out_for_delivery';
  static const String orderDelivered = 'delivered';
  static const String orderCancelled = 'cancelled';
  
  // Payment Methods
  static const String paymentCash = 'cash';
  static const String paymentCard = 'card';
  static const String paymentUpi = 'upi';
  static const String paymentWallet = 'wallet';
  
  // Cuisine Types
  static const List<String> cuisineTypes = [
    'Italian',
    'Chinese',
    'Indian',
    'Mexican',
    'Japanese',
    'Thai',
    'American',
    'Mediterranean',
    'French',
    'Korean',
  ];
  
  // Categories
  static const List<String> foodCategories = [
    'Popular',
    'Trending',
    'Fast Food',
    'Healthy',
    'Desserts',
    'Beverages',
    'Breakfast',
    'Lunch',
    'Dinner',
    'Snacks',
  ];
}

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF1E88E5);
  static const Color primaryDark = Color(0xFF1565C0);
  static const Color primaryLight = Color(0xFF64B5F6);
  
  // Secondary Colors
  static const Color secondary = Color(0xFFFF6B35);
  static const Color secondaryDark = Color(0xFFE65100);
  static const Color secondaryLight = Color(0xFFFFB74D);
  
  // Background Colors
  static const Color background = Color(0xFFFAFAFA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFBDBDBD);
  
  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);
  
  // Rating Colors
  static const Color rating = Color(0xFFFFC107);
  
  // Border Colors
  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFEEEEEE);
  
  // Shadow Colors
  static const Color shadow = Color(0x1A000000);
  
  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, secondaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppSizes {
  // Padding & Margins
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  
  // Border Radius
  static const double radiusXs = 4.0;
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;
  static const double radiusCircular = 50.0;
  
  // Icon Sizes
  static const double iconXs = 16.0;
  static const double iconSm = 20.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;
  static const double iconXl = 48.0;
  
  // Button Heights
  static const double buttonHeight = 48.0;
  static const double buttonHeightSmall = 36.0;
  static const double buttonHeightLarge = 56.0;
  
  // Input Heights
  static const double inputHeight = 48.0;
  static const double inputHeightSmall = 40.0;
  static const double inputHeightLarge = 56.0;
  
  // Card Heights
  static const double cardHeight = 120.0;
  static const double cardHeightSmall = 80.0;
  static const double cardHeightLarge = 160.0;
  
  // App Bar Height
  static const double appBarHeight = 56.0;
  static const double appBarHeightLarge = 64.0;
  
  // Bottom Navigation Height
  static const double bottomNavHeight = 56.0;
  
  // Floating Action Button Size
  static const double fabSize = 56.0;
  static const double fabSizeSmall = 40.0;
  static const double fabSizeLarge = 72.0;
}

class AppStrings {
  // Common
  static const String ok = 'OK';
  static const String cancel = 'Cancel';
  static const String save = 'Save';
  static const String delete = 'Delete';
  static const String edit = 'Edit';
  static const String add = 'Add';
  static const String remove = 'Remove';
  static const String confirm = 'Confirm';
  static const String retry = 'Retry';
  static const String loading = 'Loading...';
  static const String error = 'Error';
  static const String success = 'Success';
  static const String warning = 'Warning';
  static const String info = 'Info';
  
  // Auth
  static const String login = 'Login';
  static const String signup = 'Sign Up';
  static const String logout = 'Logout';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String phone = 'Phone';
  static const String forgotPassword = 'Forgot Password?';
  static const String resetPassword = 'Reset Password';
  static const String dontHaveAccount = "Don't have an account?";
  static const String alreadyHaveAccount = 'Already have an account?';
  static const String signInWithGoogle = 'Sign in with Google';
  static const String signInWithApple = 'Sign in with Apple';
  
  // Home
  static const String home = 'Home';
  static const String search = 'Search';
  static const String searchHint = 'Search for restaurants, dishes...';
  static const String location = 'Location';
  static const String changeLocation = 'Change Location';
  static const String popular = 'Popular';
  static const String trending = 'Trending';
  static const String offers = 'Offers';
  static const String categories = 'Categories';
  static const String nearbyRestaurants = 'Nearby Restaurants';
  static const String viewAll = 'View All';
  
  // Restaurant
  static const String restaurant = 'Restaurant';
  static const String menu = 'Menu';
  static const String reviews = 'Reviews';
  static const String rating = 'Rating';
  static const String deliveryTime = 'Delivery Time';
  static const String distance = 'Distance';
  static const String cuisine = 'Cuisine';
  static const String openNow = 'Open Now';
  static const String closed = 'Closed';
  static const String minOrder = 'Min Order';
  static const String restaurantDeliveryFee = 'Delivery Fee';
  
  // Cart
  static const String cart = 'Cart';
  static const String emptyCart = 'Your cart is empty';
  static const String addToCart = 'Add to Cart';
  static const String removeFromCart = 'Remove from Cart';
  static const String quantity = 'Quantity';
  static const String subtotal = 'Subtotal';
  static const String deliveryFee = 'Delivery Fee';
  static const String tax = 'Tax';
  static const String total = 'Total';
  static const String promoCode = 'Promo Code';
  static const String apply = 'Apply';
  static const String checkout = 'Checkout';
  static const String clearCart = 'Clear Cart';
  
  // Orders
  static const String orders = 'Orders';
  static const String orderHistory = 'Order History';
  static const String trackOrder = 'Track Order';
  static const String orderDetails = 'Order Details';
  static const String orderId = 'Order ID';
  static const String orderDate = 'Order Date';
  static const String orderStatus = 'Order Status';
  static const String estimatedDelivery = 'Estimated Delivery';
  static const String reorder = 'Reorder';
  static const String cancelOrder = 'Cancel Order';
  
  // Profile
  static const String profile = 'Profile';
  static const String settings = 'Settings';
  static const String personalInfo = 'Personal Info';
  static const String addresses = 'Addresses';
  static const String paymentMethods = 'Payment Methods';
  static const String preferences = 'Preferences';
  static const String notifications = 'Notifications';
  static const String help = 'Help';
  static const String about = 'About';
  static const String privacyPolicy = 'Privacy Policy';
  static const String termsOfService = 'Terms of Service';
  
  // Errors
  static const String networkError = 'Network Error';
  static const String serverError = 'Server Error';
  static const String unknownError = 'Unknown Error';
  static const String connectionError = 'Connection Error';
  static const String timeoutError = 'Request Timeout';
  static const String invalidCredentials = 'Invalid Credentials';
  static const String emailAlreadyExists = 'Email already exists';
  static const String weakPassword = 'Password is too weak';
  static const String invalidEmail = 'Invalid email address';
  static const String invalidPhone = 'Invalid phone number';
  static const String fieldRequired = 'This field is required';
  static const String passwordsDontMatch = 'Passwords do not match';
  
  // Success Messages
  static const String loginSuccess = 'Login successful';
  static const String signupSuccess = 'Account created successfully';
  static const String passwordResetSent = 'Password reset email sent';
  static const String profileUpdated = 'Profile updated successfully';
  static const String orderPlaced = 'Order placed successfully';
  static const String itemAddedToCart = 'Item added to cart';
  static const String itemRemovedFromCart = 'Item removed from cart';
  static const String addressAdded = 'Address added successfully';
  static const String paymentMethodAdded = 'Payment method added';
  
  // Placeholders
  static const String noData = 'No data available';
  static const String noOrders = 'No orders yet';
  static const String noFavorites = 'No favorites yet';
  static const String noAddresses = 'No addresses saved';
  static const String noPaymentMethods = 'No payment methods saved';
} 