import 'package:auto_routes_test/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class LoginWelcome extends StatelessWidget {
  const LoginWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Login',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Please log in to enjoy all Montrack features',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.gray
          ),
        )
        
      ],
    );
  }
}