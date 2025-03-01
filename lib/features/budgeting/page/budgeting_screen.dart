import 'package:auto_route/auto_route.dart';
import 'package:auto_routes_test/common/components/custom_header.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BudgetingScreen extends StatelessWidget {
  const BudgetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(title: 'Budgeting'),
      body: Center(
        child: Text('budgeting')
      ),
    );
  }
}