// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ArticleScreen]
class ArticleRoute extends PageRouteInfo<ArticleRouteArgs> {
  ArticleRoute({Key? key, required int index, List<PageRouteInfo>? children})
    : super(
        ArticleRoute.name,
        args: ArticleRouteArgs(key: key, index: index),
        initialChildren: children,
      );

  static const String name = 'ArticleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ArticleRouteArgs>();
      return ArticleScreen(key: args.key, index: args.index);
    },
  );
}

class ArticleRouteArgs {
  const ArticleRouteArgs({this.key, required this.index});

  final Key? key;

  final int index;

  @override
  String toString() {
    return 'ArticleRouteArgs{key: $key, index: $index}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ArticleRouteArgs) return false;
    return key == other.key && index == other.index;
  }

  @override
  int get hashCode => key.hashCode ^ index.hashCode;
}

/// generated route for
/// [CategoryScreen]
class CategoryRoute extends PageRouteInfo<CategoryRouteArgs> {
  CategoryRoute({
    Key? key,
    required String category,
    List<PageRouteInfo>? children,
  }) : super(
         CategoryRoute.name,
         args: CategoryRouteArgs(key: key, category: category),
         initialChildren: children,
       );

  static const String name = 'CategoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CategoryRouteArgs>();
      return CategoryScreen(key: args.key, category: args.category);
    },
  );
}

class CategoryRouteArgs {
  const CategoryRouteArgs({this.key, required this.category});

  final Key? key;

  final String category;

  @override
  String toString() {
    return 'CategoryRouteArgs{key: $key, category: $category}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CategoryRouteArgs) return false;
    return key == other.key && category == other.category;
  }

  @override
  int get hashCode => key.hashCode ^ category.hashCode;
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}
