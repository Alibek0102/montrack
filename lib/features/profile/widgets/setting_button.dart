import 'package:auto_routes_test/features/profile/entities/profile_setting_button_model.dart';
import 'package:flutter/material.dart';

class SettingButton extends StatelessWidget {

  final ProfileSettingButtonModel settingButton;

  const SettingButton({
    required this.settingButton
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 32,
        height: 40,
        child: Row(
          children: [
            Text(
              settingButton.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.chevron_right_rounded,
              size: 24,
            )
          ],
        ),
      ),
    );
  }
}