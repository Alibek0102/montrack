import 'package:auto_route/auto_route.dart';
import 'package:auto_routes_test/common/components/custom_header.dart';
import 'package:auto_routes_test/core/colors/app_colors.dart';
import 'package:auto_routes_test/core/providers/authorization/auth_model.dart';
import 'package:auto_routes_test/features/profile/entities/profile_setting_button_model.dart';
import 'package:auto_routes_test/features/profile/widgets/setting_button.dart';
import 'package:auto_routes_test/features/profile/widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  late final Function()? logoutHandler;

  late final List<ProfileSettingButtonModel> settingButtons = [
    ProfileSettingButtonModel(title: 'Language'),
    ProfileSettingButtonModel(title: 'About Us'),
    ProfileSettingButtonModel(title: 'Help Center'),
    ProfileSettingButtonModel(title: 'Log Out', onPress: logoutHandler!)
  ];

  @override
  void initState() {
    print('init profile');
    super.initState();
    final Future<void> Function() logout = context.read<AuthModel>().logout;

    logoutHandler = () {
      logout().then((_) {
        if(mounted) context.router.replaceNamed('/login');
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomHeader(
          title: 'Profile',
        ),
        body: ListView(
          children: [
            const UserInfo(),
            ...settingButtons.map((ProfileSettingButtonModel settingButton) {
              return Column(
                children: [
                  SettingButton(settingButton: settingButton),
                  const Divider(height: 1, color: AppColors.lightGray)
                ],
              );
            })
          ],
        ));
  }
}
