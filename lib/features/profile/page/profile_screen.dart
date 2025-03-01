import 'package:auto_route/auto_route.dart';
import 'package:auto_routes_test/common/components/custom_header.dart';
import 'package:auto_routes_test/core/colors/app_colors.dart';
import 'package:auto_routes_test/features/profile/entities/profile_setting_button_model.dart';
import 'package:auto_routes_test/features/profile/widgets/setting_button.dart';
import 'package:auto_routes_test/features/profile/widgets/user_info.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final List<ProfileSettingButtonModel> settingButtons = [
    ProfileSettingButtonModel(title: 'Language'),
    ProfileSettingButtonModel(title: 'About Us'),
    ProfileSettingButtonModel(title: 'Help Center'),
    ProfileSettingButtonModel(title: 'Log Out')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomHeader(
          title: 'Profile',
        ),
        body: ListView(
          children: [
            const UserInfo(),
            ...settingButtons.map((ProfileSettingButtonModel setting_button) {
              return Column(
                children: [
                  SettingButton(settingButton: setting_button),
                  const Divider(height: 1, color: AppColors.lightGray)
                ],
              );
            })
          ],
        ));
  }
}
