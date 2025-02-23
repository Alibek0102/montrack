import 'package:auto_route/auto_route.dart';
import 'package:auto_routes_test/common/custom_button.dart';
import 'package:auto_routes_test/features/auth/widgets/auth_text_field.dart';
import 'package:auto_routes_test/features/auth/widgets/forgot_password_button.dart';
import 'package:auto_routes_test/features/auth/widgets/login_welcome.dart';
import 'package:auto_routes_test/features/auth/widgets/registration_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  final appIcon = 'assets/svg_icons/appLogo.svg';

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
            const SizedBox(height: 32),
            const AuthTextField(
              title: 'Email',
              placeholder: 'Введите пожалуйста почту',
            ),
            const SizedBox(height: 24),
            const AuthTextField(
              title: 'Password',
              placeholder: 'Введите пароль',
              isObscured: true,
            ),
            const ForgotPasswordButton(),
            const Spacer(),
            CustomButton(
              buttonText: 'Вход',
              onPressed: () {
                context.router.pushNamed('/main');
              },
            ),
            RegistrationButton(
              onPressed: () {
                context.router.pushNamed('/registration');
              },
            ),
            const SizedBox(height: 36,)
          ],
        ),
      ),
    );
  }
}