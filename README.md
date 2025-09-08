# 🍕 FoodApp - Food Delivery App

A comprehensive Food Delivery App built with Flutter using Clean Architecture, targeting both Android and iOS platforms. This app provides a complete food delivery experience similar to Zomato/Swiggy.

## 🚀 Features

### Core Features
- **User Authentication**: Email/password, Google, and Apple sign-in
- **Restaurant Discovery**: Browse restaurants by cuisine, rating, and location
- **Menu Management**: View restaurant menus with detailed item information
- **Shopping Cart**: Add items, manage quantities, and checkout
- **Order Management**: Track orders from placement to delivery
- **Search & Filters**: Advanced search with multiple filter options
- **User Profiles**: Manage personal information and preferences
- **Real-time Tracking**: Live order tracking with delivery updates

### Technical Features
- **Clean Architecture**: Domain, Data, and Presentation layers
- **State Management**: Riverpod for reactive state management
- **Dependency Injection**: GetIt for service locator pattern
- **Networking**: Dio with interceptors for API communication
- **Local Storage**: SQLite and Hive for data persistence
- **Routing**: GoRouter for navigation management
- **Theming**: Light and dark theme support
- **Responsive Design**: Works on phones and tablets

## 🏗️ Architecture

The app follows Clean Architecture principles with the following structure:

```
lib/
├── core/
│   ├── constants/          # App constants and configurations
│   ├── errors/            # Custom exception classes
│   ├── network/           # API client and networking
│   ├── theme/             # App theming
│   └── di/               # Dependency injection
├── features/
│   ├── auth/             # Authentication feature
│   ├── home/             # Home screen and discovery
│   ├── restaurant/       # Restaurant details and menus
│   ├── cart/             # Shopping cart functionality
│   ├── orders/           # Order management and tracking
│   ├── profile/          # User profile and settings
│   └── search/           # Search and filtering
└── shared/
    ├── models/           # Shared data models
    ├── widgets/          # Reusable UI components
    └── services/         # Shared services
```

## 📱 Screens

### Authentication
- **Splash Screen**: App introduction with animations
- **Login Screen**: Email/password and social login
- **Signup Screen**: User registration with validation

### Main App
- **Home Screen**: Restaurant discovery, categories, and recommendations
- **Search Screen**: Advanced search with filters
- **Restaurant Detail**: Menu items, reviews, and ordering
- **Cart Screen**: Item management and checkout
- **Orders Screen**: Order history and tracking
- **Profile Screen**: User settings and preferences

## 🛠️ Tech Stack

### Core Dependencies
- **Flutter**: 3.8.1
- **Riverpod**: State management
- **GetIt**: Dependency injection
- **Dio**: HTTP client
- **GoRouter**: Navigation
- **SQLite**: Local database
- **Hive**: NoSQL storage

### UI/UX Dependencies
- **Google Fonts**: Typography
- **Cached Network Image**: Image caching
- **Shimmer**: Loading effects
- **Lottie**: Animations
- **Carousel Slider**: Image carousels

### Location & Maps
- **Google Maps Flutter**: Map integration
- **Geolocator**: Location services
- **Geocoding**: Address conversion

### Authentication
- **Firebase Auth**: Authentication
- **Google Sign In**: Social login

### Notifications
- **Firebase Messaging**: Push notifications
- **Flutter Local Notifications**: Local notifications

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.8.1 or higher
- Dart SDK 3.8.1 or higher
- Android Studio / VS Code
- Android SDK / Xcode (for iOS)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/food_app.git
   cd food_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Configuration

1. **Firebase Setup**
   - Create a Firebase project
   - Add Android and iOS apps
   - Download and add configuration files
   - Enable Authentication and Cloud Messaging

2. **API Configuration**
   - Update `lib/core/constants/app_constants.dart`
   - Set your API base URL and keys

3. **Google Maps**
   - Add Google Maps API key to Android/iOS configuration

## 📦 Project Structure

### Core Layer
- **Constants**: App-wide constants and configurations
- **Errors**: Custom exception handling
- **Network**: API client with interceptors
- **Theme**: Light and dark theme definitions
- **DI**: Dependency injection setup

### Feature Layer
Each feature follows Clean Architecture:
- **Domain**: Business logic and entities
- **Data**: Data sources and repositories
- **Presentation**: UI components and state management

### Shared Layer
- **Models**: Data models with JSON serialization
- **Widgets**: Reusable UI components
- **Services**: Shared business logic

## 🎨 UI/UX Features

### Design System
- **Colors**: Consistent color palette
- **Typography**: Google Fonts (Poppins)
- **Spacing**: Standardized spacing system
- **Components**: Reusable UI components

### Themes
- **Light Theme**: Clean, modern design
- **Dark Theme**: Eye-friendly dark mode
- **Responsive**: Adapts to different screen sizes

### Animations
- **Splash Animation**: Logo and text animations
- **Page Transitions**: Smooth navigation
- **Loading States**: Shimmer effects
- **Micro-interactions**: Button and card animations

## 🔧 Development

### Code Generation
```bash
# Generate JSON serialization
flutter packages pub run build_runner build

# Generate dependency injection
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### Testing
```bash
# Run unit tests
flutter test

# Run widget tests
flutter test test/widget_test.dart
```

### Building
```bash
# Android APK
flutter build apk

# iOS
flutter build ios
```

## 📋 TODO

### Phase 1 (Current)
- [x] Project structure and architecture
- [x] Core infrastructure (DI, networking, theming)
- [x] Authentication screens
- [x] Basic navigation and routing
- [x] Home screen with mock data

### Phase 2 (Next)
- [ ] Restaurant detail screen
- [ ] Cart functionality
- [ ] Order management
- [ ] Search and filtering
- [ ] User profile

### Phase 3 (Future)
- [ ] Real API integration
- [ ] Push notifications
- [ ] Payment integration
- [ ] Real-time tracking
- [ ] Advanced features

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Riverpod for excellent state management
- All the package authors for their contributions

---

**Note**: This is a comprehensive food delivery app template. For production use, you'll need to:
- Integrate with real APIs
- Set up proper authentication
- Configure payment gateways
- Add proper error handling
- Implement comprehensive testing
- Set up CI/CD pipelines
