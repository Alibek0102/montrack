import 'package:auto_route/auto_route.dart';
import 'package:auto_routes_test/common/custom_button.dart';
import 'package:auto_routes_test/common/extensions/integer_extension.dart';
import 'package:auto_routes_test/features/auth/widgets/auth_text_field.dart';
import 'package:auto_routes_test/features/auth/widgets/login_welcome.dart';
import 'package:auto_routes_test/features/auth/widgets/registration_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class RegistrationScreen extends StatelessWidget {
  final appIcon = 'assets/svg_icons/appLogo.svg';
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: SvgPicture.asset(appIcon,width: 130,),
        ),
        leadingWidth: 120 + 30,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LoginWelcome(),
            32.height,
            const AuthTextField(
              title: 'Name',
              placeholder: 'Введите пожалуйста почту',
            ),
            24.height,
            const AuthTextField(
              title: 'Email',
              placeholder: 'Введите почту',
            ),
            24.height,
            const AuthTextField(
              title: 'Password',
              placeholder: 'Введите пароль',
              isObscured: true,
            ),
            24.height,
            const AuthTextField(
              title: 'Repeat password',
              placeholder: 'Повторите пароль',
              isObscured: true,
            ),
            const Spacer(),
            const CustomButton(
              buttonText: 'Зарегистрироваться',
            ),
            RegistrationButton(
              onPressed: () {
                context.router.back();
              },
              accountExists: true,
            ),
            const SizedBox(height: 36,)
          ],
        ),
      ),
    );
  }
}