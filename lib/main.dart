import 'package:auto_routes_test/core/colors/app_colors.dart';
import 'package:auto_routes_test/core/providers/authorization/auth_model.dart';
import 'package:auto_routes_test/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.ios
  );

  runApp(const MontrackApp());
}

class MontrackApp extends StatelessWidget {
  const MontrackApp({super.key});
  @override
  Widget build(BuildContext context) {

    final appRouter = AppRouter();
    final authModel = AuthModel();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 40.0),
            elevation: 0.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8)
              )
            ),
            backgroundColor: AppColors.brightBlue
          )
        )
      ),
      routerConfig: appRouter.config(
        reevaluateListenable: authModel
      ),
    );
  }
}
