import 'package:article_app/common/constants/routes.dart';
import 'package:article_app/common/routes/scaffold_with_bottom_navbar.dart';
import 'package:article_app/common/screens/under_development.dart';
import 'package:article_app/features/articlesCrud/screens/details_screen.dart';
import 'package:article_app/features/articlesCrud/screens/edit_update_screen.dart';
import 'package:article_app/features/articlesCrud/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutePath.home,
    routes: [
      GoRoute(
        path: RoutePath.details,
        name: RouteName.details,
        pageBuilder: (BuildContext context, GoRouterState state) {
          final params = state.extra as DetailsScreenRouteParams;
          return MaterialPage(
            key: state.pageKey,
            child: DetailsScreen(
              id: params.id,
            ),
          );
        },
      ),
      GoRoute(
        path: RoutePath.editUpdateScreen,
        name: RouteName.editUpdateScreen,
        pageBuilder: (BuildContext context, GoRouterState state) {
          final params = state.extra as EditUpdateScreenRouteParams?;
          return MaterialPage(
            key: state.pageKey,
            child: EditUpdateScreen(
              article: params?.article,
            ),
          );
        },
      ),

      //!bottom tab bar config
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithBottomNavbar(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(),
            routes: <RouteBase>[
              GoRoute(
                path: RoutePath.home,
                name: RouteName.home,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return MaterialPage(
                    key: state.pageKey,
                    child: const HomeScreen(),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(),
            routes: <RouteBase>[
              GoRoute(
                path: RoutePath.notifications,
                name: RouteName.notifications,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    MaterialPage(
                  key: state.pageKey,
                  child: const UnderDevelopment(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(),
            routes: <RouteBase>[
              GoRoute(
                path: RoutePath.bookmarks,
                name: RouteName.bookmarks,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    MaterialPage(
                  key: state.pageKey,
                  child: const UnderDevelopment(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(),
            routes: <RouteBase>[
              GoRoute(
                path: RoutePath.profile,
                name: RouteName.profile,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    MaterialPage(
                  key: state.pageKey,
                  child: const UnderDevelopment(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  GoRouter get router => _router;
}
