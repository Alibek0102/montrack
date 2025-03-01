import 'package:auto_route/auto_route.dart';
import 'package:auto_routes_test/core/router/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: [
        const HomeRoute(),
        const BudgetingRoute(),
        const GoalsRoute(),
        ProfileRoute()
      ],
      builder: (BuildContext context, Widget child, _){
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey[400],
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
            },
            items: const <BottomNavigationBarItem> [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
              BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Бюджет'),
              BottomNavigationBarItem(icon: Icon(Icons.flag), label: 'Цели'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
            ]
          ),
        );
      },
    );
  }
}