class ProfileSettingButtonModel {
  final String title;
  final Function() onPress;

  ProfileSettingButtonModel({
    required this.title,
    this.onPress = defaultOnPress
  });

  static void defaultOnPress(){}
}