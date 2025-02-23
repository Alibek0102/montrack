import 'package:auto_routes_test/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {

  final String title;
  final String placeholder;
  final bool isObscured;

  const AuthTextField({
    super.key,
    required this.title,
    required this.placeholder,
    this.isObscured = false
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: isObscured,
          decoration: InputDecoration(
            fillColor: AppColors.alphineShow,
            filled: true,
            hintText: placeholder,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
          ),
        )
      ],
    );
  }
}