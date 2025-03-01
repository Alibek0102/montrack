import 'package:auto_routes_test/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final bool hasBackButton;

  const CustomHeader({
    super.key,
    required this.title,
    this.hasBackButton = false
  });

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: AppColors.brightBlue,
      centerTitle: false,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          hasBackButton
          ? Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
            ),
          ) : const SizedBox(),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}