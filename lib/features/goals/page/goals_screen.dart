import 'package:auto_route/auto_route.dart';
import 'package:auto_routes_test/common/components/custom_header.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(title: 'Goals'),
      body: Center(
        child: Text('Goals'),
      ),
    );
  }
}