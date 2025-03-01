import 'package:auto_routes_test/common/extensions/integer_extension.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {

  static void show(BuildContext context, String message) {
    var snackBar = SnackBar(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      elevation: 0,
      content: SizedBox(
        // height: 45,
        width: double.infinity,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(235, 64, 52, 0.85),
            borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Row(
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.white,
                ),
                10.width,
                Expanded(
                  child: Text(
                    message,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}