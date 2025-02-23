import 'package:auto_routes_test/common/extensions/integer_extension.dart';
import 'package:flutter/material.dart';

class RegistrationButton extends StatelessWidget {

  bool accountExists = false;
  final Function() _onPressed;

  RegistrationButton({
    super.key,
    required Function() onPressed,
    this.accountExists = false
  }) : _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(accountExists ? 'Есть аккаунт?' : 'У вас нет аккаунта?'),
        5.width,
        TextButton(
          onPressed: _onPressed, 
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(0,0)
          ),
          child: Text( accountExists ? 'Вход' : 'Зарегистрироваться'),
        ),
      ],
    );
  }
}