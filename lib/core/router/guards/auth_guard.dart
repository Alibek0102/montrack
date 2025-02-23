import 'package:auto_route/auto_route.dart';
import 'package:auto_routes_test/core/router/app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {

  final bool authentifitation = false;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if(authentifitation == true){
      resolver.next();
    } else {
      resolver.redirect(
        const LoginRoute()
      );
    }
  }
}