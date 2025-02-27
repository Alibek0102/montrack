import 'package:auto_route/auto_route.dart';
import 'package:auto_routes_test/core/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter{
  
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: SplashRoute.page,
      initial: true
    ),
    AutoRoute(
      path: '/login',
      page: LoginRoute.page,
    ),
    AutoRoute(
      path: '/registration',
      page: RegistrationRoute.page
    ),
    AutoRoute(
      path: '/main',
      page: TabBarRoute.page,
      children: <AutoRoute>[
        AutoRoute(
          page: HomeRoute.page
        ),
        AutoRoute(
          page: BudgetingRoute.page
        ),
        AutoRoute(
          page: GoalsRoute.page
        ),
        AutoRoute(
          page: ProfileRoute.page
        )
      ],
    )
  ];
}