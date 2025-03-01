import 'package:auto_route/auto_route.dart';
import 'package:auto_routes_test/common/components/custom_snackbar.dart';
import 'package:auto_routes_test/common/custom_button.dart';
import 'package:auto_routes_test/core/providers/authorization/auth_model.dart';
import 'package:auto_routes_test/features/auth/widgets/auth_text_field.dart';
import 'package:auto_routes_test/features/auth/widgets/forgot_password_button.dart';
import 'package:auto_routes_test/features/auth/widgets/login_welcome.dart';
import 'package:auto_routes_test/features/auth/widgets/registration_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final appIcon = 'assets/svg_icons/appLogo.svg';

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  _LoginPageState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final onLogin = context.read<AuthModel>().login;
    final buttonStatus = context.watch<AuthModel>().buttonIsActive;
    final onAuthFieldsChanges = context.read<AuthModel>().watchAuthTextFields;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: SvgPicture.asset(
            appIcon,
            width: 130,
          ),
        ),
        leadingWidth: 120 + 30,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LoginWelcome(),
                    const SizedBox(height: 32),
                    AuthTextField(
                      title: 'Email',
                      placeholder: 'Введите пожалуйста почту',
                      controller: emailController,
                      onChanged: (_) {
                        onAuthFieldsChanges(
                            email: emailController.text,
                            password: passwordController.text);
                      },
                    ),
                    const SizedBox(height: 24),
                    AuthTextField(
                      title: 'Password',
                      placeholder: 'Введите пароль',
                      isObscured: true,
                      controller: passwordController,
                      onChanged: (_) {
                        onAuthFieldsChanges(
                            email: emailController.text,
                            password: passwordController.text);
                      },
                    ),
                    const ForgotPasswordButton(),
                  ],
                ),
              ),
            ),
            CustomButton(
              buttonText: 'Вход',
              onPressed: buttonStatus
                  ? () async {
                      try {
                        await onLogin(
                            email: emailController.text,
                            password: passwordController.text);
        
                        if (mounted) context.router.replaceNamed('/main');
                      } catch (error) {
                        CustomSnackbar.show(context, error.toString());
                      }
                    }
                  : null,
            ),
            RegistrationButton(
              onPressed: () {
                context.router.pushNamed('/registration');
              },
            ),
          ],
        ),
      ),
    );
  }
}
