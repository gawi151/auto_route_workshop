// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AppShellScreen]
class AppShellRoute extends PageRouteInfo<void> {
  const AppShellRoute({List<PageRouteInfo>? children})
    : super(AppShellRoute.name, initialChildren: children);

  static const String name = 'AppShellRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AppShellScreen();
    },
  );
}

/// generated route for
/// [Lesson1DetailsScreen]
class Lesson1DetailsRoute extends PageRouteInfo<void> {
  const Lesson1DetailsRoute({List<PageRouteInfo>? children})
    : super(Lesson1DetailsRoute.name, initialChildren: children);

  static const String name = 'Lesson1DetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Lesson1DetailsScreen();
    },
  );
}

/// generated route for
/// [Lesson1HomeScreen]
class Lesson1HomeRoute extends PageRouteInfo<void> {
  const Lesson1HomeRoute({List<PageRouteInfo>? children})
    : super(Lesson1HomeRoute.name, initialChildren: children);

  static const String name = 'Lesson1HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Lesson1HomeScreen();
    },
  );
}

/// generated route for
/// [Lesson1ShellScreen]
class Lesson1ShellRoute extends PageRouteInfo<void> {
  const Lesson1ShellRoute({List<PageRouteInfo>? children})
    : super(Lesson1ShellRoute.name, initialChildren: children);

  static const String name = 'Lesson1ShellRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Lesson1ShellScreen();
    },
  );
}

/// generated route for
/// [Lesson2ProductDetailScreen]
class Lesson2ProductDetailRoute
    extends PageRouteInfo<Lesson2ProductDetailRouteArgs> {
  Lesson2ProductDetailRoute({
    Key? key,
    required Product product,
    List<PageRouteInfo>? children,
  }) : super(
         Lesson2ProductDetailRoute.name,
         args: Lesson2ProductDetailRouteArgs(key: key, product: product),
         initialChildren: children,
       );

  static const String name = 'Lesson2ProductDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<Lesson2ProductDetailRouteArgs>();
      return Lesson2ProductDetailScreen(key: args.key, product: args.product);
    },
  );
}

class Lesson2ProductDetailRouteArgs {
  const Lesson2ProductDetailRouteArgs({this.key, required this.product});

  final Key? key;

  final Product product;

  @override
  String toString() {
    return 'Lesson2ProductDetailRouteArgs{key: $key, product: $product}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Lesson2ProductDetailRouteArgs) return false;
    return key == other.key && product == other.product;
  }

  @override
  int get hashCode => key.hashCode ^ product.hashCode;
}

/// generated route for
/// [Lesson2ProductsScreen]
class Lesson2ProductsRoute extends PageRouteInfo<void> {
  const Lesson2ProductsRoute({List<PageRouteInfo>? children})
    : super(Lesson2ProductsRoute.name, initialChildren: children);

  static const String name = 'Lesson2ProductsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Lesson2ProductsScreen();
    },
  );
}

/// generated route for
/// [Lesson2ShellScreen]
class Lesson2ShellRoute extends PageRouteInfo<void> {
  const Lesson2ShellRoute({List<PageRouteInfo>? children})
    : super(Lesson2ShellRoute.name, initialChildren: children);

  static const String name = 'Lesson2ShellRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Lesson2ShellScreen();
    },
  );
}

/// generated route for
/// [Lesson3DeepLinksScreen]
class Lesson3DeepLinksRoute extends PageRouteInfo<void> {
  const Lesson3DeepLinksRoute({List<PageRouteInfo>? children})
    : super(Lesson3DeepLinksRoute.name, initialChildren: children);

  static const String name = 'Lesson3DeepLinksRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Lesson3DeepLinksScreen();
    },
  );
}

/// generated route for
/// [Lesson3ProfileEditScreen]
class Lesson3ProfileEditRoute extends PageRouteInfo<void> {
  const Lesson3ProfileEditRoute({List<PageRouteInfo>? children})
    : super(Lesson3ProfileEditRoute.name, initialChildren: children);

  static const String name = 'Lesson3ProfileEditRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Lesson3ProfileEditScreen();
    },
  );
}

/// generated route for
/// [Lesson3ProfileScreen]
class Lesson3ProfileRoute extends PageRouteInfo<void> {
  const Lesson3ProfileRoute({List<PageRouteInfo>? children})
    : super(Lesson3ProfileRoute.name, initialChildren: children);

  static const String name = 'Lesson3ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Lesson3ProfileScreen();
    },
  );
}

/// generated route for
/// [Lesson3ProfileSettingsScreen]
class Lesson3ProfileSettingsRoute extends PageRouteInfo<void> {
  const Lesson3ProfileSettingsRoute({List<PageRouteInfo>? children})
    : super(Lesson3ProfileSettingsRoute.name, initialChildren: children);

  static const String name = 'Lesson3ProfileSettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Lesson3ProfileSettingsScreen();
    },
  );
}

/// generated route for
/// [Lesson3ShellScreen]
class Lesson3ShellRoute extends PageRouteInfo<void> {
  const Lesson3ShellRoute({List<PageRouteInfo>? children})
    : super(Lesson3ShellRoute.name, initialChildren: children);

  static const String name = 'Lesson3ShellRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Lesson3ShellScreen();
    },
  );
}

/// generated route for
/// [Lesson4ProtectedScreen]
class Lesson4ProtectedRoute extends PageRouteInfo<void> {
  const Lesson4ProtectedRoute({List<PageRouteInfo>? children})
    : super(Lesson4ProtectedRoute.name, initialChildren: children);

  static const String name = 'Lesson4ProtectedRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Lesson4ProtectedScreen();
    },
  );
}

/// generated route for
/// [Lesson4SettingsScreen]
class Lesson4SettingsRoute extends PageRouteInfo<void> {
  const Lesson4SettingsRoute({List<PageRouteInfo>? children})
    : super(Lesson4SettingsRoute.name, initialChildren: children);

  static const String name = 'Lesson4SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Lesson4SettingsScreen();
    },
  );
}

/// generated route for
/// [Lesson4ShellScreen]
class Lesson4ShellRoute extends PageRouteInfo<void> {
  const Lesson4ShellRoute({List<PageRouteInfo>? children})
    : super(Lesson4ShellRoute.name, initialChildren: children);

  static const String name = 'Lesson4ShellRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Lesson4ShellScreen();
    },
  );
}
