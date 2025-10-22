# Auto Route Workshop

A comprehensive Flutter workshop exploring the `auto_route` package for type-safe navigation. Designed for intermediate Flutter developers, this workshop covers routing fundamentals through advanced patterns.

## Quick Start

### Prerequisites
- Flutter 3.19.0 or higher
- Dart 3.9.0 or higher

### Setup

```bash
cd auto_route_workshop
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

### Development
```bash
flutter pub run build_runner watch --delete-conflicting-outputs
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

**Navigation Methods:**
```dart
// Push: Add screen to stack
context.router.push(Lesson1DetailsRoute());

// Pop: Remove screen and go back
context.router.pop();

// Replace: Replace without adding to stack
context.router.replace(NewScreenRoute());
```

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

**Type-Safe Parameters:**
```dart
@RoutePage()
class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({required this.product});

  @override
  Widget build(context) => ...
}

// Navigate with type-safe data
context.router.push(ProductDetailRoute(product: myProduct));
```

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
- Understand route resolvers
- Customize page transitions

**Route Guards (Conditional Navigation):**
```dart
class AuthGuard extends AutoRouteGuard {
  void onNavigation(NavigationResolver resolver, AutoRoutePage route) {
    if (isLoggedIn) {
      resolver.next();
    } else {
      // Prevent navigation
    }
  }
}
```

**Your Tasks:**
- TODO 1: Implement guarded route navigation
- TODO 2: Show SnackBar if access denied
- TODO 3: Implement route resolver example
- TODO 4: Add custom page transition

## Auto Route API Quick Reference

Full documentation: [pub.dev/packages/auto_route](https://pub.dev/packages/auto_route)

```dart
// Navigation
context.router.push(MyScreenRoute());
context.router.pop();
context.router.replace(MyScreenRoute());
context.router.navigateTo('path');

// Annotations
@RoutePage()
class MyScreen extends StatelessWidget { }

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [...];
}
```

## Common Mistakes & Solutions

### 1. Forgetting to Run build_runner
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 2. String Routes vs Type-Safe
```dart
// ❌ Wrong
Navigator.pushNamed(context, 'product-detail');

// ✅ Correct
context.router.push(ProductDetailRoute(product: product));
```

### 3. Missing @RoutePage() Annotation
```dart
// ❌ Wrong
class MyScreen extends StatelessWidget { }

// ✅ Correct
@RoutePage()
class MyScreen extends StatelessWidget { }
```

### 4. Mixing Navigation APIs
```dart
// ❌ Wrong - Don't mix
Navigator.push(context, MaterialPageRoute(...));
context.router.push(...);

// ✅ Correct - Use only auto_route
context.router.push(MyScreenRoute());
```

### 5. Missing Required Parameters
```dart
// ❌ Wrong
context.router.push(DetailScreenRoute());

// ✅ Correct
context.router.push(DetailScreenRoute(product: myProduct));
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

## auto_route vs go_router Comparison

### Feature Comparison

| Feature | auto_route | go_router |
|---------|-----------|----------|
| Type Safety | ✅ Full (generated) | ❌ String-based |
| Learning Curve | 🟡 Moderate | ✅ Gentle |
| Setup Complexity | 🟡 Moderate | ✅ Simple |
| Code Generation | ✅ Yes | ❌ No |
| IDE Autocomplete | ✅ Full | 🟡 Limited |
| Deep Linking | ✅ Supported | ✅ Supported |
| Route Guards | ✅ Supported | ✅ Supported |
| Nested Routing | ✅ AutoTabsRouter | ✅ ShellRoute |
| Dynamic Routes | 🟡 Limited | ✅ Better |
| Bundle Size | 🟡 Larger | ✅ Smaller |
| Maintained by | Community | Google |

### auto_route Advantages
- Type-safe routes (compiler catches errors)
- Excellent IDE support and autocomplete
- Complex nested routing (AutoTabsRouter)
- Predictable generated code

### auto_route Limitations
- Requires build_runner setup
- Extra build step in workflow
- Generated files in codebase
- Slightly larger app bundle
- Steeper learning curve

### go_router Advantages
- Simple configuration (no code generation)
- Smaller app bundle
- Better dynamic routing flexibility
- Maintained by Google
- Gentle learning curve

### go_router Limitations
- String-based routing (typo-prone)
- No compile-time checking
- Runtime errors if parameters wrong
- Manual parameter type conversion
- Limited IDE support

### Choose auto_route if you:
✅ Value type safety and compile-time checking
✅ Have complex nested navigation
✅ Want full IDE autocomplete
✅ Already use build_runner in project
✅ Building a long-term app

### Choose go_router if you:
✅ Want minimal setup
✅ Have simple routing needs
✅ Bundle size is critical
✅ Prefer Google-maintained solution
✅ Need dynamic routing flexibility

## Resources

- [auto_route Documentation](https://autoroute.vercel.app/)
- [auto_route Package](https://pub.dev/packages/auto_route)
- [go_router Package](https://pub.dev/packages/go_router)
- [Flutter Navigation Guide](https://flutter.dev/docs/development/ui/navigation)

## Next Steps After Workshop

1. Implement authentication with route guards
2. Add data pre-fetching with route resolvers
3. Create custom page transitions
4. Set up deep linking
5. Add error handling
6. Integrate analytics

---

**Happy learning! 🚀**

Check [Troubleshooting](#troubleshooting) section or [auto_route docs](https://autoroute.vercel.app/) for help.
