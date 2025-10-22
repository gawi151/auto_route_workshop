# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**auto_route_workshop** is an interactive Flutter workshop demonstrating the `auto_route` package for type-safe navigation. The project is structured as a single Flutter app with 4 progressive lessons accessible via bottom navigation tabs.

**Target Audience:** Intermediate Flutter developers exploring auto_route as a routing solution

**Key Tech Stack:**
- Flutter 3.19.0+
- Dart 3.9.0+
- auto_route 10.2.0
- build_runner (for code generation)
- auto_route_generator

## Project Structure

```
lib/
├── main.dart                    # Entry point
├── router/
│   └── app_router.dart          # Route configuration (@AutoRouterConfig)
│   └── app_router.gr.dart       # GENERATED - do not edit
├── screens/
│   ├── app_shell.dart           # Root shell with AutoTabsRouter for tab management
│   ├── lesson1_home.dart        # Lesson 1: Basic routing
│   ├── lesson1_details.dart
│   ├── lesson2_products.dart    # Lesson 2: Named routes & parameters
│   ├── lesson2_product_detail.dart
│   ├── lesson3_profile.dart     # Lesson 3: Nested routing
│   ├── lesson3_profile_edit.dart
│   ├── lesson3_profile_settings.dart
│   ├── lesson4_settings.dart    # Lesson 4: Advanced patterns
│   ├── lesson4_protected.dart
│   └── export.dart
├── models/
│   ├── product.dart             # Used in Lesson 2
│   ├── user.dart                # Used in Lesson 3
│   └── export.dart
└── common/
    ├── lesson_card.dart         # Reusable widget
    └── export.dart

.vscode/
├── launch.json                  # VS Code debug configuration
└── tasks.json                   # VS Code build tasks

docs/
├── README.md                    # Complete workshop documentation
├── SOLUTIONS.md                 # All TODO solutions
└── CLAUDE.md                    # This file
```

## Key Commands

### Setup & Dependencies

```bash
# Install dependencies
flutter pub get

# Generate router code (required after modifying app_router.dart or screens)
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode (auto-regenerate when files change)
flutter pub run build_runner watch --delete-conflicting-outputs
```

### Development & Running

```bash
# Run the app with hot reload
flutter run

# Run with specific device
flutter run -d <device_id>

# Clean build
flutter clean

# Format code
flutter format .

# Analyze code
flutter analyze
```

### VS Code

- **Debug:** Press `F5` or Run → Start Debugging
- **Build Tasks:** Press `Ctrl+Shift+B`
- **Available tasks:** flutter pub get, build_runner, watch mode, format, analyze

## Architecture & Design

### Single Router Approach

This workshop uses a **single AppRouter** with all lessons organized as routes. No monorepo structure - everything is in one Flutter app.

```
AppRouter
├── AppShellRoute (root with bottom nav)
│   ├── Lesson 1 routes
│   │   ├── Lesson1HomeRoute
│   │   └── Lesson1DetailsRoute
│   ├── Lesson 2 routes
│   │   ├── Lesson2ProductsRoute
│   │   └── Lesson2ProductDetailRoute
│   ├── Lesson 3 routes
│   │   ├── Lesson3ProfileRoute
│   │   ├── Lesson3ProfileEditRoute
│   │   └── Lesson3ProfileSettingsRoute
│   └── Lesson 4 routes
│       ├── Lesson4SettingsRoute
│       └── Lesson4ProtectedRoute
```

### AutoTabsRouter for Tab Management

Each lesson is a tab. The `AutoTabsRouter` in `app_shell.dart` manages 4 independent navigation stacks - one per tab. This is the **key architectural pattern** for understanding nested routing.

```dart
// In app_shell.dart
AutoTabsRouter(
  routes: [
    Lesson1HomeRoute(),
    Lesson2ProductsRoute(),
    Lesson3ProfileRoute(),
    Lesson4SettingsRoute(),
  ],
  builder: (context, child) => Scaffold(
    body: child,
    bottomNavigationBar: BottomNavigationBar(
      onTap: (index) => tabsRouter.setActiveIndex(index),
    ),
  ),
)
```

Each tab maintains its own stack. Switching tabs preserves navigation history.

### Code Generation Pattern

All screens are marked with `@RoutePage()`:
```dart
@RoutePage()
class MyScreen extends StatelessWidget { ... }
```

The router uses `@AutoRouterConfig()`:
```dart
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [...];
}
```

Build_runner generates:
- `app_router.gr.dart` - Contains route classes and generated code
- Type-safe route constructors (e.g., `Lesson1DetailsRoute(...)`)

**Important:** After adding/modifying screens or routes, always run:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## How to Work with This Project

### To Run the Workshop

1. `flutter pub get`
2. `flutter pub run build_runner build --delete-conflicting-outputs`
3. `flutter run`

### To Add a New Screen

1. Create new screen file in `lib/screens/`
2. Add `@RoutePage()` annotation
3. Define constructor parameters (these become route parameters)
4. Add route to `app_router.dart`
5. Run build_runner to generate route class
6. Use it: `context.router.push(NewScreenRoute())`

### To Modify a Route

1. Edit `lib/router/app_router.dart`
2. Run build_runner

### To Run Watch Mode (for development)

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

Auto-generates routes when you save changes.

## Important Concepts

### Navigation Stack

- `push()` - Add screen to stack
- `pop()` - Remove current screen
- `replace()` - Replace current screen without adding to history

```dart
context.router.push(D());             // Stack: [A, B, C, D]
context.router.pop();                 // Stack: [A, B, C]
context.router.replace(NewRoute());   // Stack: [A, B, NewRoute]
```

### Type-Safe Parameters

```dart
@RoutePage()
class DetailScreen extends StatelessWidget {
  final Product product;  // ← Becomes a required route parameter
  const DetailScreen({required this.product});
}

// Navigate
context.router.push(DetailScreenRoute(product: product));
```

### Independent Tab Stacks

Each tab in bottom navigation maintains its own independent navigation stack. This is managed by `AutoTabsRouter`.

```
Tab 1: [Home]              Tab 2: [Products]              Tab 3: [Profile]
  ↓ user navigates           ↓ user navigates               ↓ user navigates
Tab 1: [Home, Details]     Tab 2: [Products, Detail]     Tab 3: [Profile, Edit]

← Switch to Tab 1          → Switch to Tab 2              → Switch to Tab 3
Shows: [Home, Details]     Shows: [Products, Detail]     Shows: [Profile, Edit]
```

This is the key concept for **Lesson 3: Nested Routing**.

## Common Tasks

### Implement Navigation Between Screens

```dart
// In a button onPressed
ElevatedButton(
  onPressed: () {
    context.router.push(NextScreenRoute());
  },
  child: const Text('Navigate'),
),
```

### Pass Data Between Screens

```dart
// Define parameter in destination screen
@RoutePage()
class DetailScreen extends StatelessWidget {
  final Product product;
  const DetailScreen({required this.product});
  // ...
}

// Navigate with data
context.router.push(DetailScreenRoute(product: selectedProduct));
```

### Understand What Lesson to Modify

- **Lesson 1 (Basic Routing):** Look at `lesson1_*.dart` files
- **Lesson 2 (Parameters):** Look at `lesson2_*.dart` files
- **Lesson 3 (Nested Routing):** Look at `app_shell.dart` and `lesson3_*.dart` files
- **Lesson 4 (Advanced):** Look at `lesson4_*.dart` files and `app_router.dart`

## Debugging Tips

### Build Errors After Route Changes

```bash
# Clean everything and rebuild
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

### Routes Not Found

- Verify `@RoutePage()` annotation exists on the screen
- Verify route is added to `app_router.dart`
- Verify build_runner has been run

### Hot Reload Not Working

- Stop app and run `flutter run` again
- Run build_runner manually

### Wrong Import for Route

- Routes are auto-generated. Import the generated classes:
```dart
// These are generated in app_router.gr.dart
context.router.push(Lesson1DetailsRoute());
```

## Files to Avoid Editing

- `lib/router/app_router.gr.dart` - This is generated by build_runner. DO NOT EDIT manually. Delete it and regenerate if corrupted.

## Files You Should Edit

- `lib/screens/lesson*.dart` - Add implementations for TODOs
- `lib/router/app_router.dart` - Add/modify routes
- `lib/screens/app_shell.dart` - Only if changing tab structure
- `lib/models/*.dart` - If adding new data models

## Testing the App

### Run Entire App

```bash
flutter run
```

### Navigate Through Lessons

1. Start in Lesson 1
2. Complete each TODOs
3. Test navigation with `context.router.push()`, `.pop()`, `.replace()`
4. Switch between tabs
5. Verify independent stacks work (switch away and back, history preserved)

### Key Testing Scenarios

- **Lesson 1:** Basic push/pop works
- **Lesson 2:** Parameters pass correctly between screens
- **Lesson 3:** Switching tabs preserves stack history
- **Lesson 4:** Guards and resolvers prevent/allow navigation

## Useful Resources

- README.md - Comprehensive workshop guide
- SOLUTIONS.md - All TODO solutions (reference when stuck)
- [auto_route Docs](https://autoroute.vercel.app/)
- [pub.dev auto_route](https://pub.dev/packages/auto_route)

## Project Purpose

This is an **educational workshop**, not production code. Its purpose is to:
- Teach auto_route concepts progressively
- Compare auto_route vs go_router
- Provide hands-on experience with type-safe routing
- Help teams decide on routing solutions

## When Helping with This Project

If you're asked to help with this project:

1. **Read the README.md first** - Understand the workshop structure
2. **Check SOLUTIONS.md** - See if the help is about one of the TODOs
3. **Understand the lessons:**
   - Lesson 1 = basic push/pop
   - Lesson 2 = parameters & data passing
   - Lesson 3 = nested routing & independent stacks
   - Lesson 4 = advanced patterns (guards, resolvers, transitions)
4. **Remember:** This is a learning project. Hints and explanations are better than complete solutions for participant TODOs.
5. **If asked about go_router vs auto_route:** See README.md comparison table

## Quick Reference

| Need | Location | Command |
|------|----------|---------|
| Add new screen | Create in `lib/screens/` | `@RoutePage()` annotation |
| Add new route | `lib/router/app_router.dart` | Add to routes list |
| Regenerate | Terminal | `flutter pub run build_runner build` |
| Run app | Terminal | `flutter run` |
| See solutions | `SOLUTIONS.md` | Read for reference |
| Full docs | `README.md` | All concepts explained |
| Debug | VS Code | Press F5 |

---

Last updated: October 2025
Workshop version: 1.0
Target: Intermediate Flutter developers
Duration: 1-2 hours
