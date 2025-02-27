import 'package:auto_route/auto_route.dart';
import 'package:auto_routes_test/core/providers/authorization/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    final authProvider = context.read<AuthModel>();

    if(authProvider.hasAvailableToken() == true) {
      context.router.replaceNamed('/main');
    } else {
      context.router.replaceNamed('/login');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}