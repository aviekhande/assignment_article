import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/article/presentation/pages/article_page.dart';
import '../../features/category/presentation/pages/category_deatil_listing_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: CategoryRoute.page, initial: false),
    AutoRoute(page: ArticleRoute.page, initial: false),
  ];
}
