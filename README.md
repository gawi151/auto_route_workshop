# Auto Route Workshop

A comprehensive Flutter workshop exploring the `auto_route` package for type-safe navigation. Designed for intermediate Flutter developers, this workshop covers routing fundamentals through advanced patterns.

## Quick Start

### Prerequisites
- Flutter 3.35.6 or higher
- Dart 3.9.2 or higher

### Setup

```bash
cd auto_route_workshop
flutter pub get
flutter pub run build_runner build -d
flutter run
```

### Development
```bash
flutter pub run build_runner watch -d
```

## Project Overview

Single Flutter app with 4 lessons accessible via bottom navigation tabs. Each tab has its own independent navigation stack.

```
lib/
├── main.dart
├── router/app_router.dart
├── screens/
│   ├── app_shell.dart
│   ├── lesson1_*.dart
│   ├── lesson2_*.dart
│   ├── lesson3_*.dart
│   └── lesson4_*.dart
├── models/
│   ├── product.dart
│   └── user.dart
└── common/lesson_card.dart
```

## Lesson 1: Basic Routing Setup

**Learning Goals:**
- Understand AppRouter configuration
- Learn push() and pop() navigation
- Implement screen-to-screen navigation
- Understand navigation stack
- Learn how to implement guards
- Deep linking
- Custom transitions setup

**Your Tasks:**
- TODO 1 in lesson1_home.dart: Navigate to details using push()
- TODO 2 in lesson1_details.dart: Understand pop() (back button handles it automatically)

**How to Verify:**
1. Run `flutter run`
2. Go to Lesson 1 tab
3. Click "Go to Details" button
4. Verify details screen appears
5. Click back button - should return to home

## Lesson 2: Named Routes & Parameters

**Learning Goals:**
- Pass data between screens
- Type-safe parameter passing
- Navigate with data to detail screens

**Your Tasks:**
- TODO 1 in lesson2_products.dart: Navigate to ProductDetailScreen with product parameter
- TODO 2 in lesson2_product_detail.dart: Display the received product
- TODO 3 (Challenge): Use replace() for alternate product navigation

**How to Verify:**
1. Go to Lesson 2 tab
2. See product list
3. Tap a product - details should show
4. Verify name, price, description display
5. Try "View Another Product" - check stack behavior

## Lesson 3: Nested Routing

**Learning Goals:**
- Understand independent navigation stacks per tab
- Learn how AutoTabsRouter manages multiple stacks
- Navigate within tabs without affecting other tabs

**How Independent Stacks Work:**
```
Tab 1: [Home]           Tab 2: [Products]
  ↓ push Details          ↓ push ProductDetail
Tab 1: [Home, Details]  Tab 2: [Products, ProductDetail]

← Switch to Tab 1       → Switch to Tab 2
Shows: [Home, Details]  Shows: [Products, ProductDetail]
(History preserved!)
```

**Your Tasks:**
- TODO 1 in lesson3_profile.dart: Navigate to ProfileEditScreen
- TODO 2: Navigate to ProfileSettingsScreen
- TODO 3: Implement pop back to profile

**How to Verify:**
1. Go to Lesson 3 (Profile) tab
2. Click "Edit Profile"
3. **Important:** Switch to Lesson 1, then back to Lesson 3
4. Verify you're still on Edit Profile (stack preserved!)
5. Click back - should return to profile

## Lesson 4: Advanced Patterns

**Learning Goals:**
- Implement route guards
- Understand async data fetch
- Customize page transitions

**Your Tasks:**
- TODO 1: Implement guarded route navigation
- TODO 2: Show SnackBar if access denied
- TODO 3: Implement data fetch guard example
- TODO 4: Add custom page transition

## Auto Route API Quick Reference

**Navigation Methods:**
```dart
// Push: Add screen to stack
context.router.push(Lesson1DetailsRoute());

// Pop: Remove screen and go back
context.router.pop();

// Replace: Replace without adding to stack
context.router.replace(NewScreenRoute());

// NavigatePath: Navigate to path (there are other somethingPath methods)
context.router.naviatePath('/your/path');
```

**Annotations:**
```dart
// Annotations
@RoutePage()
class MyScreen extends StatelessWidget { }

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [...];
}
```

## Troubleshooting

**"Route not found" Error**
- Did you run build_runner?
- Does the screen have @RoutePage()?
- Check for typos in route names

**Hot Reload Not Working After Route Changes**
```bash
flutter clean
flutter pub get
flutter pub run build_runner build
flutter run
```

**Can't Navigate to Nested Screens in Tabs**
- Verify all screens are registered under the root route
- Check that routes are properly organized in app_router.dart

## Resources

- [auto_route Package](https://pub.dev/packages/auto_route)

---

**Happy learning! 🚀**
